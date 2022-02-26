require 'rails_helper'

RSpec.feature "Logins", type: :feature do
   let(:user) { FactoryBot.create(:user1) }

  scenario "Login with invalid parameter" do
      visit login_path
      fill_in "Email", with: ""
      fill_in "Password", with: ""
      click_button "Log in"
      expect(page).to have_http_status(200)
      expect(page).to have_content "ログインに失敗しました"

      click_link "Log in"
      expect(page).to_not have_content "ログインに失敗しました"
  end
  scenario "Login with valid parameter" do
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "ログインしています"
  end

  scenario "Login with invalid password" do
    visit login_path
    fill_in "Email", with: "testuser@gmail.com"
    fill_in "Password", with: "passwordwitherror"
    click_button "Log in"
    expect(page).to have_content "失敗" 
  end

  
end
