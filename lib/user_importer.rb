class UserImporter
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @table = RemoteTable.new "#{@filename}"
  end

  def rows
    @table.rows
  end

  def sanitized_rows
    @table.rows.map do |row|
      row.each_with_object({}) do |kv, acc|
        k,v = kv
        acc[k.to_s.strip] = v
      end
    end
  end

  def normalize_year(years)
    years ||= ""
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
    position ||= ""
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
    unknown_position = Position.find_or_create_by!(name: "Unknown")
    sanitized_rows.each do |row|

      years = normalize_year(row["Year"])

      newsletter = row["do_not_email"] == "1" ? false : true
      privacy_settings = {}
      privacy_settings["do_not_snail_mail"] = row["do_not_snail_mail"]
      privacy_settings["do_not_call"] = row["do_not_call"]
      privacy_settings["do_not_solicit"] = row["do_not_solicit"]
      privacy_settings["do_not_email"] = row["do_not_email"]

      user = User.new(
      email: row["Email"].to_s,
      first_name: row["First Name"],
      last_name: row["Last Name"],
      nickname: row["Nickname"],
      maiden_name: row["Maiden Name"],
      salutation: row["Salutation"],
      privacy_settings: privacy_settings,
      subscribed_to_alumni_newsletter: newsletter
      )

      programs = years.map do |year|
        start_date = Date.new(year, 6, 1)
        end_date = Date.new(year, 8, 31)

        begin
          Program.find_or_create_by!(
          name:       "Summer #{year}",
          start_date: start_date,
          end_date:   end_date
          )
        rescue
          puts "The year #{year} is invalid for user #{user}"
        end
      end

      all_positions = normalize_position(row["Position"])

      positions = all_positions.map do |position|
        Position.find_or_create_by!(name: position)
      end

      if user.save(validate: false)
        programs.zip(positions).each do |program, position|
          position ||= unknown_position
          positions_held = PositionsHeld.find_or_create_by!(
          user_id: user.id,
          position_id: position.id,
          program_id: program&.id
          )
        end
      end
    end
  end
end
