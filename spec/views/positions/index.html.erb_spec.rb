require 'rails_helper'

RSpec.describe "positions/index", type: :view do
  before(:each) do
    assign(:positions, [
      Position.create!(
        :name => "Name",
        :position_type => "Position Type"
      ),
      Position.create!(
        :name => "Name",
        :position_type => "Position Type"
      )
    ])
  end

  it "renders a list of positions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Position Type".to_s, :count => 2
  end
end
