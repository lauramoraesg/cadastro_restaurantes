require "spec_helper"

describe RestaurantesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/restaurantes").to route_to("restaurantes#index")
    end


    it "routes to #show" do
      expect(:get => "/restaurantes/1").to route_to("restaurantes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/restaurantes").to route_to("restaurantes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/restaurantes/1").to route_to("restaurantes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/restaurantes/1").to route_to("restaurantes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/restaurantes/1").to route_to("restaurantes#destroy", :id => "1")
    end

  end
end
