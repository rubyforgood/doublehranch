require 'rails_helper'

describe 'UserImporter' do
  let(:filename) { File.join(Rails.root, "spec", "resources", "anonymized_user_data.xlsx") }
  let(:subject) { UserImporter.new(filename) }

  it 'instantiates with a filename' do
    expect { subject }.to_not raise_error
  end
end