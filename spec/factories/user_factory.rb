FactoryBot.define do
  factory :user do
    name  { "test user" } 
    email   { "testuser@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
    # password_digest  { "#{User.digest("password")}" } 
  end
end