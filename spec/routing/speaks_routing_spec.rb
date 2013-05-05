require "spec_helper"

describe SpeaksController do
  describe "routing" do

    it "routes to #index" do
      get("/speaks").should route_to("speaks#index")
    end

    it "routes to #new" do
      get("/speaks/new").should route_to("speaks#new")
    end

    it "routes to #show" do
      get("/speaks/1").should route_to("speaks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/speaks/1/edit").should route_to("speaks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/speaks").should route_to("speaks#create")
    end

    it "routes to #update" do
      put("/speaks/1").should route_to("speaks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/speaks/1").should route_to("speaks#destroy", :id => "1")
    end

  end
end
