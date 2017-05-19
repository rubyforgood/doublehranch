require 'rails_helper'

describe 'UserImporter' do
  let(:filename) { File.join(Rails.root, "spec", "resources", "anonymized_user_data.xlsx") }
  let(:subject) { UserImporter.new(filename) }

  it 'instantiates with a filename' do
    expect { subject }.to_not raise_error
  end

  it 'can read the file' do
    expect(subject.filename).to eq(filename)
  end

  it 'read the first row' do
    expect(subject.rows.first).to eq({
                                      "Last Name"=>"zzzztt",
                                      "Title Name"=>"zz. zzzzy zzzztt",
                                      "Email"=>"zzzzztt86@gzzzz.zzz",
                                      "Year "=>"2008,09",
                                      "Position "=>"Outdoor Extreme",
                                      "Additional Info"=>""
                                      })
    end

  context 'can sanitize the data' do
    it 'splits the year' do
      expect(subject.normalize_year("2016,14,17")).to eq(["2016", "2014", "2017"])
    end

    it 'handles whitespace correctly' do
      expect(subject.normalize_year("1234,    1123,  45, 34   ,14")).to eq(["1234", "1123", "2045", "2034", "2014"])
    end

    it 'handles & correctly' do
      expect(subject.normalize_year("  2016 &     14,   17")).to eq(["2016", "2014", "2017"])
    end
  end
end
