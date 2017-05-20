require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { create(:user) }

  describe 'POST create' do
    context 'with valid attributes' do
      before do
        user.confirm
        sign_in user
      end

      it 'will not create post if there is no image' do
        expect {
          post :create, params: {post: {caption: 'Here is my first post'}}
        }.to change { Post.count }.by 0
      end
    end
  end

end
