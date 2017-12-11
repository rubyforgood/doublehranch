require 'rails_helper'

RSpec.describe "Programs", type: :request do

  before :each do
    user = create(:user, :admin)
    sign_in(user)
  end

  describe "GET /programs" do
    it "works!" do
      get programs_path
      expect(response).to have_http_status(200)
    end
  end
end
