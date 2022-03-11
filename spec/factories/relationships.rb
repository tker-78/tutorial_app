


FactoryBot.define do
  99.times do |n|
    factory "followinguser#{n}", class: :user do
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

  factory "one", class: :relationship do
    follower { followinguser1 }
    followed { followinguser51 }
  end
  factory "two", class: :relationship do
    follower { followinguser2 }
    followed { followinguser52 }
  end
  factory "three", class: :relationship do
    follower { followinguser3 }
    followed { followinguser53 }
  end
  factory "four", class: :relationship do
    follower { followinguser4 }
    followed { followinguser54 }
  end

end