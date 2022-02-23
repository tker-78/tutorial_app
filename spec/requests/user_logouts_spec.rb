require 'rails_helper'

RSpec.describe "UserLogouts", type: :request do
  describe "user logouts" do
<<<<<<< HEAD
    let(:user) { FactoryBot.build(:user)}
=======
    # let(:user) { FactoryBot.build(:user)}
>>>>>>> advanced-login
    it "logout success" do
      delete logout_path
      expect(is_logged_in?).to be_falsey
    end
  end
end
