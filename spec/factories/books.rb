FactoryBot.define do
  factory :book, class: Book do
    category
    title {"Ruby programming"}
    description {"Description"}
    publish_date {"2019-01-01"}
    number_pages {100}
    price {101010}
    author {"TSN"}
  end
end
