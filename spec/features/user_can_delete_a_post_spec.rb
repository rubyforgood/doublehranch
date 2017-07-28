require 'rails_helper'

xdescribe 'a user can delete a post' do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  before do
    user.confirm
    sign_in user
  end

  it 'allows user to delete a post' do
    visit posts_path
    expect { click_link 'Delete Post' }.to change(Category, :count).by(-1)
  end
end
