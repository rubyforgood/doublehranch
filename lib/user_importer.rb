class UserImporter
  attr_reader :filename

  def initialize(filename)
    @filename = filename

    @table = RemoteTable.new "#{@filename}"
  end

  def rows
    @table.rows
  end

  def normalize_year(years)
    list_of_years = years.split(/[,&]/)
    list_of_years.map do |year|
      year = year.strip
      if year.length == 2
        "20#{year}"
      else
        year
      end
    end
  end

end
# last name e.rows.first["Last Name"]
# some stuff with names e.rows.first["Title Name"] maybe title or first name or last name or whatever
# email e.rows.first["Email"] but sometimes 2 emails
# year e.rows.first["Year"]
# position e.rows.first["Position"]
# e.rows.first["Additional Info"]
