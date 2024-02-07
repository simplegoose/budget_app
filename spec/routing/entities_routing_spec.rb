require "rails_helper"

RSpec.describe EntitiesController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(get: "/categories/1/entities/new").to route_to("entities#new", category_id: '1')
    end

    it "routes to #create" do
      expect(post: "/categories/1/entities").to route_to("entities#create", category_id: '1')
    end

  end
end
