FactoryGirl.define do
  factory :store do
    name { Faker::Name.name }
    user_id rand(1..150)
    street_address {Faker::AddressUS.street_address}
    city { Faker::AddressUS.city}
    state { Faker::AddressUS.state}
    zip { Faker::AddressUS.zip_code}
  end
end