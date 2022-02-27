require 'rails_helper'

RSpec.feature "User signup", type: :feature do
  before do
    ActionMailer::Base.deliveries.clear
  end


  scenario "create new user" do
      visit root_path
      click_link "Sign up now"
      fill_in "Name", with: "tatataa"
      fill_in "Email", with: "tatat@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Confirmation", with: "password"

      click_button "Create my account"
      expect(page).to have_content("メールでのユーザー認証を完了してください")
  end

  scenario "fail to create new user" do
    visit root_path
    click_link "Sign up now"
    fill_in "Name", with: ""
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Confirmation", with: ""

    click_button "Create my account"
    expect(page).to have_content("ユーザー登録に失敗しました")
    expect(page).to have_content "The form contains 4 errors"
  end

 
end
