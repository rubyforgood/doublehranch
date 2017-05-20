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

    context 'sanitization' do
      context 'year' do
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

      context 'email' do
      end

      context 'position' do
        it 'can get an array of positions' do
          expect(subject.normalize_position("Barn Staff, Barn Director, Barn Director")).to eq(["Barn Staff", "Barn Director", "Barn Director"])
        end
      end

      context 'matching' do
        it 'can match years to positions in a perfect world' do
          years = ["2016", "2014", "2017"]
          positions = ["Barn Staff", "Barn Director", "Barn Director"]
          expected = {
            "2016"=>"Barn Staff",
            "2014"=>"Barn Director",
            "2017"=>"Barn Director"
          }
          expect(subject.join_year_and_position(years,positions)).to eq(expected)
        end

        it 'can match years to positions where there are less positions' do
          years = ["2016", "2014", "2017"]
          positions = ["Barn Staff", "Barn Director"]
          expected = {
            "2016"=>"Barn Staff",
            "2014"=>"Barn Director",
            "2017"=> nil
          }
          expect(subject.join_year_and_position(years,positions)).to eq(expected)
        end
        it 'can match years to positions when there are less years' do
          years = ["2016", "2014"]
          positions = ["Barn Staff", "Barn Director", "Barn Director"]
          expected = {
            "2016"=>"Barn Staff",
            "2014"=>"Barn Director",
          }
          expect(subject.join_year_and_position(years,positions)).to eq(expected)
        end
      end
<<<<<<< HEAD

      it 'can import each row' do
        expect(subject.import_by_row).to eq()
      end

      it 'normalizes column names' do
        expect(subject.normalize_column_names).rows.first["Year"].should_not eq(nil)
      end
=======
>>>>>>> 06b75e01d63ce67b70682be959b5c60dfa42b7ea
    end
  end
