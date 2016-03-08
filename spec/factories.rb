require 'faker'

FactoryGirl.define do
  factory :item do
    name Faker::Commerce.product_name
    description Faker::Lorem.sentence(8)
    image_url "http://robohash.org/6.png?set=set2&bgset=bg1&size=200x200"
    created_at "2016-02-23T00:00:00.000Z"
    updated_at "2016-02-23T00:00:00.000Z"
  end
end
