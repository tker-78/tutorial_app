require 'rails_helper'

RSpec.feature "Logins", type: :feature do
<<<<<<< HEAD
  FactoryBot.build(:user)
=======
   FactoryBot.build(:user)

>>>>>>> advanced-login
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
<<<<<<< HEAD
    fill_in "Email", with: "nonono@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(page).to_not have_content("Log in")
    expect(page).to have_content("Users")
    expect(page).to have_content("Log out")
    expect(page).to have_content("Profile")
=======
    fill_in "Email", with: "testuser@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(page).to have_content "ログインしています"
>>>>>>> advanced-login
  end

  scenario "Login with invalid password" do
    visit login_path
<<<<<<< HEAD
    fill_in "Email", with: "nonono@gmail.com"
=======
    fill_in "Email", with: "testuser@gmail.com"
>>>>>>> advanced-login
    fill_in "Password", with: "passwordwitherror"
    click_button "Log in"
    expect(page).to have_content "失敗" 
  end
<<<<<<< HEAD
=======

  
>>>>>>> advanced-login
end
