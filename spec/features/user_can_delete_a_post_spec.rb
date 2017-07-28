require 'rails_helper'

describe 'a user can delete a post' do
  before(:each) do
    user = create(:user)
    post = create(:post, user: user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, :scope => :user)
  end

  it 'allows user to delete a post' do
    visit "/posts/1"
    expect { click_on 'Delete Post' }.to change(Post, :count).by(-1)
  end
end
