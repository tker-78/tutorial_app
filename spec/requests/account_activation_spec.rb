require 'rails_helper'

RSpec.describe "AccountActivations", type: :request do
  before do
    ActionMailer::Base.deliveries.clear
  end
  describe "when account created" do
    let(:user) { FactoryBot.create(:user11)}
    it "new user is not activated" do
      expect(user.activated?).to be_falsey
    end
    it "user is activated" do
      # ユーザーがメール認証を完了する
      get edit_account_activation_path(user.activation_token, email: user.email )
      user.reload
      expect(user.activated?).to be_truthy
    end
  end
end
