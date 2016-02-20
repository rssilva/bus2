require "rails_helper"

RSpec.describe AlertsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/alerts").to route_to("alerts#index")
    end

    it "routes to #new" do
      expect(:get => "/alerts/new").to route_to("alerts#new")
    end

    it "routes to #show" do
      expect(:get => "/alerts/1").to route_to("alerts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/alerts/1/edit").to route_to("alerts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/alerts").to route_to("alerts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/alerts/1").to route_to("alerts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/alerts/1").to route_to("alerts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/alerts/1").to route_to("alerts#destroy", :id => "1")
    end

  end
end
