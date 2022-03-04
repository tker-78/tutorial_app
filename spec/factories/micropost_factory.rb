FactoryBot.define do
  factory :mostrecent, class: :micropost do
    association :user
    content { "most resent" }
  end

  factory :micropost do
    content { "content 1" }
    user_id { "user80" }
  end
end


