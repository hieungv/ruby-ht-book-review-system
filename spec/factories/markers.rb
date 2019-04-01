FactoryBot.define do
  factory :marker, class: Marker do
    user
    book
    type {"favorite"}
  end
end
