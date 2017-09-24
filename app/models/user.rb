class User < ApplicationRecord
  HONORIFICS = %w(
    Mr.
    Ms.
    Mrs.
    Dr.
  ).freeze

  # NOTE: privacy_settings column is an hstore in Postgres, which removes type
  # information and converts fields to string, thus false becomes "false" string.

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :email_templates, foreign_key: :author_id
  has_many :positions_held
  has_many :positions, through: :positions_held
  has_many :posts

  has_attached_file :profile_photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\z/

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :salutation, inclusion: HONORIFICS

  def friendly_name
    nickname || first_name || "Friend"
  end

  def self.search(search)
    search.downcase!
    where("lower(first_name) LIKE ? OR lower(last_name) LIKE ? OR lower(maiden_name) LIKE ? OR lower(nickname) LIKE ? OR lower(email) LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
  end

end
