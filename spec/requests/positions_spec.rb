require 'rails_helper'

RSpec.describe "Positions", type: :request do

  before :each do
    user = create(:user, :admin)
    sign_in(user)
  end

  describe "GET /positions" do
    it "works!" do
      get positions_path
      expect(response).to have_http_status(200)
    end
  end
end
