20.times do
  a = User.create({
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    password: 'password',
    password_confirmation: 'password',
    store_owner: true
  })
  a.stores.create({
    name: Faker::Name.name,
    street_address: Faker::AddressUS.street_address,
    city: Faker::AddressUS.city,
    state: Faker::AddressUS.state,
    zip: Faker::AddressUS.zip_code,
  })
end