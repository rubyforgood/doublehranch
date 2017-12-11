require "rails_helper"

RSpec.describe PositionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/positions").to route_to("positions#index")
    end

    it "routes to #new" do
      expect(:get => "/positions/new").to route_to("positions#new")
    end

    it "routes to #show" do
      expect(:get => "/positions/1").to route_to("positions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/positions/1/edit").to route_to("positions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/positions").to route_to("positions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/positions/1").to route_to("positions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/positions/1").to route_to("positions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/positions/1").to route_to("positions#destroy", :id => "1")
    end

  end
end
