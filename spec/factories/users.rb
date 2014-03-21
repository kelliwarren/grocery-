FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.phone_number }
    store_owner { false }
    email {Faker::Internet.email}
    password "password"
    password_confirmation "password"

  end
end


