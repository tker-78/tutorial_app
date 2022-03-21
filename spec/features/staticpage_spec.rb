require 'rails_helper'

RSpec.feature "Staticpages", type: :feature do
  let(:user) { FactoryBot.create(:user)}
  scenario "ログインする" do
    visit root_path
    click_link "Log in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content "ログインしています"
  end
end
