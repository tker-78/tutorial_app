require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User validation" do
    let(:user) {User.new(name: "kino", email: "email@gmail.com", 
                          password: "password", 
                          password_confirmation: "password" )}
    it "when name is blank" do
      user.name = " "
      expect(user).to_not be_valid
    end

    it "when email is blank" do
      user.email = ""
      expect(user).to_not be_valid
    end

    it "when user name length is 51" do
      user.name = "a" * 51
      expect(user).to_not be_valid
    end

    it "when user name length is 50" do
      user.name = "a" * 50
      expect(user).to be_valid
    end

    it "when user email length is 255" do
      user.email = "a" * 245 + "@gmail.com"
      expect(user).to be_valid
    end

    it "when user email lenght is 256" do
      user.email = "a" * 246 + "@gmail.com"
      expect(user).to_not be_valid
    end
  end


  describe "User Email" do
    let(:user){ User.create(name: "kino", email: "kino@gmail.com", 
                            password: "password",
                            password_confirmation: "password")}
    context "email format" do
      it "when invalid email" do
        user.email = "aaa.gmail.com"
        expect(user).to_not be_valid
      end

      it "when valid email address" do
        user.email = "kkk@gmail.com"
        expect(user).to be_valid
      end
    end

    context "email uniqueness" do
      it "when email duplicated" do
        duplicated_user = user.dup
        duplicated_user.email = user.email.upcase
        duplicated_user.save
        expect(duplicated_user).to_not be_valid
      end
    end

    context "email is saved as lower case" do
      it "when input email is upper case" do
        user.email = "KKKAAA@gmail.com"
        user.save
        expect(user.email).to eq "kkkaaa@gmail.com"
      end
    end
  end

  describe "User Password" do
    let(:user) { User.create(name: "kino", email: "kkk@gmail.com",
                             password: "password", password_confirmation: "password")}
    context "password length is less than 6 charactors" do
      it "password is invalid" do
        user.password = "a" * 5 
        user.password_confirmation = "a" * 5
        user.save
        expect(user).to_not be_valid
      end
    end

    context "password length is over 6 charactors" do
      it "password is valid" do
        user.password = "a" * 6 
        user.password_confirmation = "a" * 6
        user.save
        expect(user).to be_valid
      end
    end

  end


  describe "following users" do
    before do
      @user = FactoryBot.create(:user60)
      @other_user = FactoryBot.create(:user61)
    end

    it "follow and unfollow a user" do
      expect(@user.following?(@other_user)).to be_falsey
      @user.follow(@other_user)
      expect(@user.following?(@other_user)).to be_truthy
      expect(@other_user.followers.include?(@user)).to be_truthy
      @user.unfollow(@other_user)
      expect(@user.following?(@other_user)).to be_falsey

    end
  end
end
