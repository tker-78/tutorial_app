require 'rails_helper'

RSpec.feature "MicropostInterfaces", type: :feature do
  before do
    @user = FactoryBot.create(:user90)
    @micropost = @user.microposts.create(content: "new content")
    @other_user = FactoryBot.create(:user91)
    
  end
  scenario "create new feed" do
    #@userでログインする
    log_in_as @user
    visit root_path
    fill_in "micropost_content", with: "renewed content"
    click_button "Post"
    expect(page).to have_content "renewed content"
  end

  scenario "delete feed" do
    log_in_as @user
    visit root_path
    expect {
      within '#micropost-1' do 
        click_link "delete"
      end
    }.to change{ Micropost.count}.by(-1)
    expect(page).to_not have_content "new content"

    log_in_as @other_user
    visit user_path(@user)
    expect(page).to_not have_link 'delete'
  end
end

