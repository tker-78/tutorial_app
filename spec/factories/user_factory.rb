FactoryBot.define do
  factory :user, class: :user do
    name  { "test user" } 
    email   { "testuser@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
    # password_digest  { "#{User.digest("password")}" } 
    remember_digest { "remember_digest"}
  end
  factory :user2, class: :user do
    name  { "test user2" } 
    email   { "testuser2@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
    # password_digest  { "#{User.digest("password")}" } 
    remember_digest { "remember_digest"}
  end
end