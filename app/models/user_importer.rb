class UserImporter
  TRUTHY = ["1", "true", "yes", "y"]
  HEADER_ROW = ["1",
                "Salutation",
                "First Name",
                "Nickname",
                "Last Name",
                "Maiden Name",
                "Email",
                "Title Name",
                "Last",
                "Year",
                "Position",
                "verified_info",
                "missing_lookup",
                "do_not_snail_mail",
                "do_not_call",
                "do_not_solicit",
                "do_not_email",
                "Additional Info"]

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

  def normalize_position(positions)
    positions ||= ""
    positions.split(",").map(&:strip)
  end

  def join_year_and_position(years, positions)
    #TODO: set field needs review if the counts don't line up and/or notes
    #section with why it doesn't line up.
    Hash[years.zip(positions)]
  end

  def extract_privacy_settings(row)
    boolean_columns = row.slice("do_not_snail_mail", "do_not_call", "do_not_solicit", "do_not_email")
    boolean_columns.each_with_object({}) do |kv, acc|
      k, v = kv
      v = TRUTHY.include?(v.to_s.downcase)
      acc[k] = v
    end
  end

  def valid_headers?
    sanitized_rows.first.keys.sort == HEADER_ROW.sort
  end

  def compare_headers
    sanitized_rows.first.keys.sort == HEADER_ROW.sort
    {expected: HEADER_ROW,
     actual: sanitized_rows.first.keys}
  end

  def import_by_row
    unknown_position = Position.find_or_create_by!(name: "Unknown")
    sanitized_rows.each do |row|

      years = normalize_year(row["Year"])

      privacy_settings = extract_privacy_settings(row)
      newsletter = privacy_settings["do_not_email"]

      user = User.new(
      email: row["Email"].strip,
      first_name: row["First Name"].strip,
      last_name: row["Last Name"].strip,
      nickname: row["Nickname"].strip,
      maiden_name: row["Maiden Name"].strip,
      salutation: row["Salutation"].strip,
      privacy_settings: privacy_settings,
      subscribed_to_alumni_newsletter: newsletter
      )

      existing_user = User.where(email: user.email,
                                 first_name: user.first_name,
                                 last_name: user.last_name).last
      if existing_user
        new_attributes = {nickname: user.nickname,
                          maiden_name: user.maiden_name,
                          salutation: user.salutation}
        new_attributes.each do |attr|
          existing_user.update(attr[0].to_sym => attr[1]) if attr[1].present?
        end
        user = existing_user
      end


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
          puts "User #{user} has an invalid year: #{year}. Unable to save."
        end
      end

      all_positions = normalize_position(row["Position"])

      positions = all_positions.map do |position|
        Position.find_or_create_by!(name: position)
      end

      if user.save(validate: false)
        programs.zip(positions).each do |program, position|
          position ||= unknown_position
          PositionsHeld.find_or_create_by!(
            user_id: user.id,
            position_id: position.id,
            program_id: program&.id
          )
        end
      end
    end
  end
end
