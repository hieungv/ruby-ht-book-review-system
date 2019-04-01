require "faker"

FactoryBot.define do
  factory :user_profile, class: UserProfile do
    user
    name {Faker::Name.name}
    gender {"male"}
    birthday {"1997-01-01"}
    address {"Viet Nam"}
    phone {"0966666666"}
  end
end
