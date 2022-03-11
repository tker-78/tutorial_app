require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user1 = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
    @relationship = Relationship.new(follower_id: @user1.id, followed_id: @user2.id)
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

  it "follower and following is 1" do
    @user1.follow(@user2)
    @user2.follow(@user1)
    expect(@user1.following.count).to eq 1
    expect(@user1.followers.count).to eq 1
  end
end
