require "spec_helper"

describe PratosController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pratos").to route_to("pratos#index")
    end

    it "routes to #show" do
      expect(:get => "/pratos/1").to route_to("pratos#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/pratos").to route_to("pratos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pratos/1").to route_to("pratos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pratos/1").to route_to("pratos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pratos/1").to route_to("pratos#destroy", :id => "1")
    end

  end
end
