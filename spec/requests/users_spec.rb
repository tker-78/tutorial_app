require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "PATCH /users/:id" do

    let(:user) {FactoryBot.create(:user4)}

    it "returns http success" do
      log_in_as user
      patch user_path(user), params: { user: {name: "kino", email: "changes@gmail.com", password: "", password_confirmation: "" }}
      expect(response).to redirect_to user_path(user)
      user.reload
      expect(user.name).to eq "kino"
    end
  
    it "returns http failure" do
      log_in_as user
      patch user_path(user), params: { user: { name: "", email: "", password: "", password_confirmation: ""}}
      user.reload
      expect(user.name).to eq "test user4" 
    end
  end

  describe "GET /users/:id" do
    let(:user) { FactoryBot.create(:user4)}

    it "redirect to edit when not logged in" do
      get edit_user_path user
      expect(response).to redirect_to login_path
    end
  end

  describe "login with other user" do
    let(:user) { FactoryBot.create(:user5)}
    let(:other_user) { FactoryBot.create(:user6)}

    it "redirect to edit when logged in as wrong user" do
      log_in_as other_user
      get edit_user_path user
      expect(response).to redirect_to users_path

      # before_actionで,correct_userを適用する
    end

    it "redirect update when logged in as wrong user" do
      log_in_as other_user
      put user_path user
      expect(response).to redirect_to users_path
    end
  end
end
