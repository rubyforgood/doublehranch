class User < ApplicationRecord
  HONORIFICS = %w(
    Miss
    Mr.
    Mrs.
    Ms.
  ).freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :email_templates, foreign_key: :author_id
  has_many :positions
  has_many :posts

  has_attached_file :profile_photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\z/

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :salutation, inclusion: HONORIFICS

  def friendly_name
    first_name || nickname || "Friend"
  end
end

