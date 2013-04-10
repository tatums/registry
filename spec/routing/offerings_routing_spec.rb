require "spec_helper"

describe OfferingsController do
  describe "routing" do

    it "routes to #index" do
      get("/offerings").should route_to("offerings#index")
    end

    it "routes to #new" do
      get("/offerings/new").should route_to("offerings#new")
    end

    it "routes to #show" do
      get("/offerings/1").should route_to("offerings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/offerings/1/edit").should route_to("offerings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/offerings").should route_to("offerings#create")
    end

    it "routes to #update" do
      put("/offerings/1").should route_to("offerings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/offerings/1").should route_to("offerings#destroy", :id => "1")
    end

  end
end
