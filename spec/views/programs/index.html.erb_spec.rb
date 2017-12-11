require 'rails_helper'

RSpec.describe "programs/index", type: :view do
  before(:each) do
    assign(:programs, [
      Program.create!(
        :name => "Name"
      ),
      Program.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of programs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
