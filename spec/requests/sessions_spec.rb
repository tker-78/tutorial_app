require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { FactoryBot.create(:user3)}
  describe "login with remember me" do
    it "has remember_token in cookies" do
      log_in_as(user)
      expect(cookies[:remember_token]).to_not be_empty
    end
  end


end
