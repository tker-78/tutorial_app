require 'rails_helper'

RSpec.describe Micropost, type: :model do
    before do
      @user = FactoryBot.create(:user55) 
      @micropost = @user.microposts.create(content: "sample text", user_id: @user.id)
      @mostrecent = @user.microposts.create(content: "most recent", user_id: @user.id) 
    end
  context "valid micropost" do
    it "micropost is valid" do
      expect(@micropost).to be_valid
    end

    it "micropost user id is present" do
      expect(@micropost.user_id).to_not eq nil
    end
  end

  context "invalid micropost" do
    it "micropost user id is not present" do
      @micropost.user_id = nil
      expect(@micropost).to_not be_valid
    end
  
    it "micropost content length is over 144 chars" do
      @micropost.content = "a" * 145
      expect(@micropost).to_not be_valid
    end
  end

  context "micropost order" do
    it "ordered most resent first" do
      expect(@user.microposts.find_by(content: "most recent")).to eq Micropost.first
    end
  end
end
