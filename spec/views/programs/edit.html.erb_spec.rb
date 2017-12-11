require 'rails_helper'

RSpec.describe "programs/edit", type: :view do
  before(:each) do
    @program = assign(:program, Program.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit program form" do
    render

    assert_select "form[action=?][method=?]", program_path(@program), "post" do

      assert_select "input[name=?]", "program[name]"
    end
  end
end
