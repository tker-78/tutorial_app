require 'rails_helper'

RSpec.describe "Microposts", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @micropost = @user.microposts.create(content: "content", user_id: @user.id)
  end
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
