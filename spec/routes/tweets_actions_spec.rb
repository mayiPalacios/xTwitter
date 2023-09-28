require 'rails_helper'


RSpec.describe "TweetsActions", type: :routing do
  describe "POST /tweets/:id/quote" do
    it("creates a new quoted tweet succesfully ") do
    expect(post("/tweets/2/quote")).to route_to("tweets#quote",id: "2")
  end
  end

  describe "POST /tweets/:id/retweet" do
    it "creates a new retweet" do
      expect(post("/tweets/2/retweet")).to route_to("tweets#retweet",id:"2")
    end
  end
end
