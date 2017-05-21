require 'rails_helper'

describe 'UserImporter' do
  let(:filename) { File.join(Rails.root, "spec", "resources", "anonymized_user_data_2017-05-20.xlsx") }
  let(:subject) { UserImporter.new(filename) }

  it 'instantiates with a filename' do
    expect { subject }.to_not raise_error
  end

  it 'can read the file' do
    expect(subject.filename).to eq(filename)
  end

  it 'read the first rows without sanitization' do
    expect(subject.rows.first).to eq({
      1=>"2",
      "Salutation"=>"zz.",
      "First Name"=>"zzzzy",
      "Nickname"=>"",
      "Last Name"=>"zzzzzz",
      "Maiden Name"=>"",
      "Email"=>"zzzzzzz86@zzzzz.zzz",
      "Title Name"=>"zz. zzzzy zzzzzz",
      "Last"=>"zzzzzz",
      "Year "=>"2008,09",
      "Position "=>"Outdoor Extreme",
      "verified_info"=>"1",
      "missing_lookup"=>"0",
      "do_not_snail_mail"=>"",
      "do_not_call"=>"",
      "do_not_solicit"=>"",
      "do_not_email"=>"",
      "Additional Info"=>""
    })
  end

  context 'sanitization' do
    context 'year' do
      it 'splits the year' do
        expect(subject.normalize_year("2016,14,17")).to eq([2016, 2014, 2017])
      end

      it 'handles whitespace correctly' do
        expect(subject.normalize_year("1234,    1123,  45, 34   ,14")).to eq([1234, 1123, 2045, 2034, 2014])
      end

      it 'handles & correctly' do
        expect(subject.normalize_year("  2016 &     14,   17")).to eq([2016, 2014, 2017])
      end
    end

    context 'position' do
      it 'can get an array of positions' do
        expect(subject.normalize_position("Barn Staff, Barn Director, Barn Director")).to eq(["Barn Staff", "Barn Director", "Barn Director"])
      end
    end

    context 'matching' do
      it 'can match years to positions in a perfect world' do
        years = [2016, 2014, 2017]
        positions = ["Barn Staff", "Barn Director", "Barn Director"]
        expected = {
          2016=>"Barn Staff",
          2014=>"Barn Director",
          2017=>"Barn Director"
        }
        expect(subject.join_year_and_position(years,positions)).to eq(expected)
      end

      it 'can match years to positions where there are less positions' do
        years = [2016, 2014, 2017]
        positions = ["Barn Staff", "Barn Director"]
        expected = {
          2016=>"Barn Staff",
          2014=>"Barn Director",
          2017=> nil
        }
        expect(subject.join_year_and_position(years,positions)).to eq(expected)
      end
      it 'can match years to positions when there are less years' do
        years = [2016, 2014]
        positions = ["Barn Staff", "Barn Director", "Barn Director"]
        expected = {
          2016=>"Barn Staff",
          2014=>"Barn Director",
        }
        expect(subject.join_year_and_position(years,positions)).to eq(expected)
      end
    end

    it 'normalizes column names' do
      actual = subject.sanitized_rows.first.keys
      expect(actual).to include("Year")
    end
  end

  xit 'imports things' do
    subject.import_by_row
    expect(User.all.count).to_not eq(0)
  end

  context 'extracts privacy settings' do
    let(:row) do
      {
        "verified_info"=>"1",
        "missing_lookup"=>"0",
        "do_not_snail_mail"=>"1",
        "do_not_call"=>1,
        "do_not_solicit"=>"false",
        "do_not_email"=>true,
      }
    end
    let(:actual) { subject.extract_privacy_settings(row) }

    it 'converts all values to boolean' do
      expect(actual.values.all? { |v| [true, false].include?(v) }).to eq(true)
    end

    it 'extracts string false as false boolean' do
      expect(actual["do_not_solicit"]).to eq(false)
    end

    it 'converts string 1 to true' do
      expect(actual["do_not_snail_mail"]).to eq(true)
    end

    it 'keeps boolean true as is' do
      expect(actual["do_not_email"]).to eq(true)
    end

    it 'converts integer 1 to true' do
      expect(actual["do_not_call"]).to eq(true)
    end
  end

  it 'normalizes column names' do
    expected = ["1",
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
                "Additional Info"].sort
    expect(subject.sanitized_rows.first.keys.sort).to eq(expected)
  end
end
