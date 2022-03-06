require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    user1 = FactoryBot.create(:user1)
    user2 = FactoryBot.create(:user2)
    @relationship = Relationship.new(follower_id: user1.id, followed_id: user2.id)
  end

  it "is valid" do
    expect(@relationship).to be_valid
  end

  context "follower id is nil" do
    it "is not valid" do
      @relationship.follower_id = nil
      expect(@relationship).to_not be_valid
    end
  end
end
