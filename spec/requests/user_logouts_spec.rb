require 'rails_helper'

RSpec.describe "UserLogouts", type: :request do
  describe "user logouts" do
    let(:user) { FactoryBot.build(:user)}
    it "logout success" do
      delete logout_path
      expect(is_logged_in?).to be_falsey
    end
  end
end
