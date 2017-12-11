require 'rails_helper'

RSpec.describe "positions/new", type: :view do
  before(:each) do
    assign(:position, Position.new(
      :name => "MyString",
      :position_type => "MyString"
    ))
  end

  it "renders new position form" do
    render

    assert_select "form[action=?][method=?]", positions_path, "post" do

      assert_select "input[name=?]", "position[name]"

      assert_select "input[name=?]", "position[position_type]"
    end
  end
end
