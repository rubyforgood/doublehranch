require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { create(:user) }

  describe "POST create" do
    context "with valid attributes" do
      before do
        user.confirm
        sign_in user
      end

      it "creates a post with an associated user" do
        post :create, params: {post: {caption: "Here is my first post"}}
        expect(Post.last.user).to eq user
      end
    end
  end

end
