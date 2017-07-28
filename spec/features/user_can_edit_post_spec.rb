require 'rails_helper'

describe 'a user can edit a post caption' do
  before(:each) do
    user = create(:user)
    post = create(:post, user: user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, :scope => :user)
  end

  it 'allows user to edit a post caption' do
    visit "/posts/1"
    click_on 'Edit Post'
    expect(current_path).to eq("/posts/1/edit")
    fill_in "caption", with: "replaced"
    click_on 'Submit Edits'
    expect(current_path).to eq("/posts/1")
    expect(page).to have_content("replaced")
  end
end
