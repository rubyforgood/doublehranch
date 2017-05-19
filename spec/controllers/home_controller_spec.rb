require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    subject { get :index }
    let(:user) { create(:user) }

    context 'when not logged in' do
      it 'should redirect to the login page' do
        expect(subject).to redirect_to new_user_session_path
      end
    end

    context 'when user is logged in' do
      before do
        user.confirm
        sign_in user
      end

      it 'should show the index page' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

end
