require 'rails_helper'

RSpec.feature "Logins", type: :feature do
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
end
