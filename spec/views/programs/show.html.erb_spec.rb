require 'rails_helper'

RSpec.describe "programs/show", type: :view do
  before(:each) do
    @program = assign(:program, Program.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
