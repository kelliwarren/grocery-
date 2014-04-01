User.delete_all
Store.delete_all
Product.delete_all
Order.delete_all
LineItem.delete_all

20.times do
  a = User.create({
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    password: 'password',
    password_confirmation: 'password',
    store_owner: true
  })
  b = Store.create({
    name: Faker::Name.name,
    street_address: Faker::AddressUS.street_address,
    city: Faker::AddressUS.city,
    state: Faker::AddressUS.state,
    zip: Faker::AddressUS.zip_code,
    user_id: a.id
  })
  20.times do
    Product.create({
      name: Faker::Product.product,
      description: Faker::BaconIpsum.words(num = 10).join(" "),
      price: rand(1..10).to_f,
      quantity: 100,
      image:'string.jpg',
      store_id: b.id
    })
  end
end

