FactoryBot.define do
  factory :relationship, class: Relationship do
    follower {user}
    followed {admin}
  end
end
