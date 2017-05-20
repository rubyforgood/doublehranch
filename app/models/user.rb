class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :email_templates, foreign_key: :author_id
  has_many :posts

  has_attached_file :profile_photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\z/

  has_many :sent_emails, foreign_key: :sender_id
  has_many :received_emails, foreign_key: :recipient_id

  def self.default_admin_users
    %w(info help).map { |email| find_by(email: "#{email}@doublehranch.com") }
  end
end

