require 'rails_helper'

RSpec.feature "Followings", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    log_in_as @user

  end

  scenario "following page" do
    visit following_user_path(@user)
    expect(@user.following).to be_truthy
    expect(page.body).to include @user.following.count.to_s
    @user.following.each do |user|
      assert_select "b[href=?]", user_path(user)
    end
  end

  scenario "followers page" do
    visit followers_user_path(@user)
    expect(@user.followers).to be_truthy
    expect(page.body).to include @user.followers.count.to_s
    @user.followers.each do |user|
      assert_select "b[href=?]", user_path(user)
    end
  end
end
