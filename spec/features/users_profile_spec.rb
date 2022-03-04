require 'rails_helper'

RSpec.feature "UsersProfiles", type: :feature do
  before do
    @user = FactoryBot.create(:user80)
    30.times do
      FactoryBot.create("micropost", user_id: @user.id)
    end
  end
  scenario "gravatar is displayed" do
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
    expect(page).to have_content "Microposts (30)"
    assert_selector 'h1>img.gravatar'
    assert_selector 'div.pagination'
  end
end
