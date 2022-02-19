FactoryBot.define do
  factory :user do
    name  { "nonono" } 
    email   { "nonono@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
    # password_digest  { "#{User.digest("password")}" } 
  end
end