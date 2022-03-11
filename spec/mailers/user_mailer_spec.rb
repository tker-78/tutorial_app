require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    let(:user) { FactoryBot.create(:user14) }
    let(:mail) { UserMailer.account_activation(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Account activation")
      expect(mail.to).to eq(["testuser14@user.com"])
      expect(mail.from).to eq(["noreply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi #{user.name}")
    end
  end

  describe "password_reset" do
    let(:user) { FactoryBot.create(:user15)}
    let(:mail) { UserMailer.password_reset(user) }

    it "renders the headers" do
      user.create_reset_digest
      expect(mail.subject).to eq("Password Reset")
      expect(mail.to).to eq(["#{user.email}"])
      expect(mail.from).to eq(["noreply@example.com"])
    end

    it "renders the body" do
      user.create_reset_digest
      expect(mail.body.encoded).to match("Hi #{user.name}")
    end
  end

end
