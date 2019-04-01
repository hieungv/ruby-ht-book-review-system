FactoryBot.define do
  factory :comment, class: Comment do
    user
    content {"Nice"}
    association :commentable, factory: :activity
  end
end
