require "spec_helper"

describe HeartsController do
  describe "routing" do

    it "routes to #index" do
      get("/hearts").should route_to("hearts#index")
    end

    it "routes to #new" do
      get("/hearts/new").should route_to("hearts#new")
    end

    it "routes to #show" do
      get("/hearts/1").should route_to("hearts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hearts/1/edit").should route_to("hearts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hearts").should route_to("hearts#create")
    end

    it "routes to #update" do
      put("/hearts/1").should route_to("hearts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hearts/1").should route_to("hearts#destroy", :id => "1")
    end

  end
end
