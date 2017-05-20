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

  it 'read the first row' do
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

        xit 'can import each row' do
          expect(subject.import_by_row).to eq()
        end

        it 'normalizes column names' do
          actual = subject.normalize_column_names.first["Year"]
          expect(actual).not_to eq(nil)
        end
      end

      xit 'can import each row' do
        expect(subject.import_by_row).to eq()
      end

      it 'normalizes column names' do
        expect(subject.normalize_column_names.first["Year"]).not_to eq(nil)
      end

    end
