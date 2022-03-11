require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user2)
  end

  context "when not logged in" do
    it "can not follow" do
      pending
      raise
    end
  
    it "can not unfollow" do
      pending
      raise
    end
  end

  context "when logged in" do
    it "can follow other user" do
      log_in_as @user
      expect{ 
        post relationships_path, params: { followed_id: @other_user.id }
    }.to change{ Relationship.count }.by(1)
    end


    it "can unfollow other user" do
      log_in_as @user
      @user.follow(@other_user)
      relationship = @user.active_relationships.find_by(followed_id: @other_user.id)
      expect{ 
        delete relationship_path(relationship)
    }.to change{ Relationship.count }.by(-1)
    end
  end

end
