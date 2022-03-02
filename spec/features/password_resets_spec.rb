require 'rails_helper'

RSpec.feature "PasswordResets", type: :feature do
  before do
    @testuser = FactoryBot.create(:user50) 
  end

  # before do
  #   ActionMailer::Base.deliveries.clear
  # end

  scenario "password resets" do
    visit new_password_reset_path
    fill_in "Email", with: "testuser@gmail.com"
    click_button "password reset"
    expect(page).to have_content "emailの登録がありませんでした"

    fill_in "Email", with: "testuser50@gmail.com"
    click_button "password reset"
    expect(page).to have_content "パスワードリセット用のメールを送りました"
    @user = User.find_by(email: "testuser50@gmail.com")
    @user.create_reset_digest
    expect(@user.reset_token).to_not eq nil
    expect(@user.reset_digest).to_not eq nil
    expect(@user.activated?).to be_truthy

    visit edit_password_reset_path(@user.reset_token, email: @user.email)
    fill_in "Password", with: "passpass"
    fill_in "Confirmation", with: "passpass"
    click_button "Update password"
    @user.reload
    expect(@user.authenticate("passpass")).to be_truthy
  end
end
