class Announcement < ApplicationRecord
  validates_presence_of :text, :start_date, :end_date

  def active?
      (start_date <= Date.today) && (end_date >= Date.today)
  end

  scope :active, -> { where("? BETWEEN start_date AND end_date", Date.today) }
  
end
