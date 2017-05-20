class UserImporter
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @table = RemoteTable.new "#{@filename}"
  end

  def rows
    @table.rows
  end

  def normalize_column_names
    @table.rows.map do |row|
      row.each_with_object({}) do |kv, acc|
        k,v = kv
        acc[k.to_s.strip] = v
      end
    end
  end

  def normalize_year(years)
    list_of_years = years.split(/[,&]/)
    list_of_years.map do |year|
      year = year.strip
      if year.length == 2
        "20#{year}".to_i
      else
        year.to_i
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

  def import_by_row
    normalize_column_names.each do |row|
      binding.pry
      year = normalize_year(row["Year"])
      position = normalize_position(row["Position"])
      join_year_and_position(year, position)

      User.find_or_create(
        email: row["Email"],
        first_name: row["First Name"],
        last_name: row["Last Name"],
        nickname: row["Nickname"],
        maiden_name: row["Maiden Name"],
        salutation: row["Salutation"]
      )

      Program.find_or_create(
        name:       "Summer #{row["Year"]}",
        start_date: DateTime.new(row["Year"], 6, 1),
        end_date:   DateTime.new(row["Year"], 8, 31)
      )

      Position.find_or_create(
        name:      row["Position"],
      )

    end
  end
end
