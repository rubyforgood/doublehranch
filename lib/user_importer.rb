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

  def normalize_position(position)
    list_of_positions = position.split(",")
    list_of_positions.map do |position|
      position.strip
    end
  end

  def join_year_and_position(years, positions)
    #TODO: set field needs review if the counts don't line up and/or notes
    #section with why it doesn't line up.
    Hash[years.zip(positions)]
  end
end
