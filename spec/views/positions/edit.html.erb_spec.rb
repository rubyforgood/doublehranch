require 'rails_helper'

RSpec.describe "positions/edit", type: :view do
  before(:each) do
    @position = assign(:position, Position.create!(
      :name => "MyString",
      :position_type => "MyString"
    ))
  end

  it "renders the edit position form" do
    render

    assert_select "form[action=?][method=?]", position_path(@position), "post" do

      assert_select "input[name=?]", "position[name]"

      assert_select "input[name=?]", "position[position_type]"
    end
  end
end
