require 'rails_helper'

xdescribe 'a user can delete a post' do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  it 'allows user to delete a post' do
    visit new_user_session_path
    fill_in "Email", with: "user1@example.com"
    save_and_open_page
    fill_in "Password", with: "hunter2"
    visit posts_path
    expect { click_on 'Delete Post' }.to change(Post, :count).by(-1)
  end
end
