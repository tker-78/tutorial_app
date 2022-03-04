FactoryBot.define do
  factory :mostrecent, class: :micropost do
    association :user
    content { "most resent" }
  end
end
