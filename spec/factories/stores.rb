FactoryGirl.define do
  factory :store do
    name { Faker::Name.name }
    street_address {Faker::AddressUS.street_address}
    city { Faker::AddressUS.city}
    state { Faker::AddressUS.state}
    zip { Faker::AddressUS.zip_code}
    user { create(:user) }
  end
end