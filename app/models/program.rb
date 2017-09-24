class Program < ApplicationRecord
  def years
    years = []
    if start_date && end_date
      start_year = start_date.year
      end_year = end_date.year
      y = start_year
      while y <= end_year
        years.push(y)
        y += 1
      end
      years
    elsif start_date
      years = years.push(start_date.year)
    elsif end_date
      years = years.push(end_date.year)
    end
  end
end
