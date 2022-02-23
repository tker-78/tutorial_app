require 'rails_helper'

RSpec.feature "UserLogouts", type: :feature do
  let(:user) { FactoryBot.build(:user) }
  scenario "logout in 2 tabs" do
    visit login_path
    fill_in "Email", with: "testuser@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_content "ログインしています" 

    click_link "Log out"
    expect(page).to have_content "ログアウトしました"
  end
end
