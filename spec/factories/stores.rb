FactoryGirl.define do
  factory :store do
    name { Faker::Name.name }
    # user_id rand(1..150)a store belongs to a user, so we need to actually create one in this factory.  user {create(:user)}
    street_address {Faker::AddressUS.street_address}
    city { Faker::AddressUS.city}
    state { Faker::AddressUS.state}
    zip { Faker::AddressUS.zip_code}
    user { create(:user) }
  end
end