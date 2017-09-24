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

  validates :salutation, inclusion: HONORIFICS
  validates :last_name,  presence: true
  validates :first_name, presence: true
  validates :email,
            uniqueness: {scope: [:last_name, :first_name]},
            allow_blank: true,
            :if => lambda {|attr| attr.present?}

  before_create do |user|
    if user.privacy_settings.empty?
      user.privacy_settings = {
        "personal"=>{"name"=>true, "email"=>true, "address"=>true, "phone"=>true},
        "social"=>{"facebook"=>true, "twitter"=>true, "instagram"=>true, "linked_id"=>true, "tumblr"=>true},
        "contact"=>{"solicitation"=>true, "emails"=>true, "phone_calls"=>true, "snail_mail"=>true},
        "camp"=>{"volunteer_info"=>true, "donor_info"=>true, "alumni_info"=>true, "counselor_info"=>true, "hospital_outreach_info"=>true}
      }
    end

    keys = ["personal", "social", "contact", "camp"]

    keys.each do |key|
      user.privacy_settings[key] ||= {}
    end
  end

  def friendly_name
    nickname || first_name || "Friend"
  end

  def self.search(search)
    where("first_name LIKE ? OR last_name LIKE ? OR nickname LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
  end

end
