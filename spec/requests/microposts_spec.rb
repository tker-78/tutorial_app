require 'rails_helper'

RSpec.describe "Microposts", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @micropost = @user.microposts.create(content: "content", user_id: @user.id)
  end
  context "create micropost" do
    it "when not logged in" do
      expect { post microposts_path, params: { micropost: { content: "new micropost" }}
    }.to_not change {Micropost.count}
    end

    it "when logged in" do
      log_in_as @user
      expect { post microposts_path, params: { micropost: { content: "new micropost" }}
      }.to change {Micropost.count}
    end
  end

  context "delete micropost" do
    it "when not logged in" do
      expect{ delete micropost_path(@micropost) }.to_not change{Micropost.count}
    end

    it "when logged in" do
      log_in_as @user
      expect { delete micropost_path(@micropost)}.to change{Micropost.count}.by(-1)
    end
    
    context "when logged in as other user" do
      let(:otheruser) { FactoryBot.create(:user88)}
      it "micropost can not be deleted" do
        log_in_as otheruser
        expect{ delete micropost_path(@micropost) }.to_not change{ Micropost.count }
      end
    end
  end
end