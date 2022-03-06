


FactoryBot.define do
  99.times do |n|
    factory "following user#{n}", class: :user do
      name { "test user#{n}" }
      email { "testuser#{n}@gmail.com" }
      password { "password" }
      password_confirmation { "password" }
      remember_digest { "remember_digest" }
      admin { nil }
      activated { true unless n == 11 }
      activated_at { Time.zone.now }
    end
  end
end