require 'rails_helper'

describe 'UserImporter' do


  it 'instantiates with a filename' do
    filename = File.join(Rails.root, "spec", "resources", "anonymized_user_data.xlsx")
    expect { UserImporter.new(filename) }.to_not raise_error
  end
end