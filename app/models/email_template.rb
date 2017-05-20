class EmailTemplate < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :label, presence: true, uniqueness: true
  validates :subject, presence: true
  validates :body, presence: true
end

