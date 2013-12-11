require "spec_helper"

describe StressesController do
  describe "routing" do

    it "routes to #index" do
      get("/stresses").should route_to("stresses#index")
    end

    it "routes to #new" do
      get("/stresses/new").should route_to("stresses#new")
    end

    it "routes to #show" do
      get("/stresses/1").should route_to("stresses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stresses/1/edit").should route_to("stresses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stresses").should route_to("stresses#create")
    end

    it "routes to #update" do
      put("/stresses/1").should route_to("stresses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stresses/1").should route_to("stresses#destroy", :id => "1")
    end

  end
end
