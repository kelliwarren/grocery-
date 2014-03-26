# Read about factories at https://github.com/thoughtbot/factory_girl

#FactoryGirl.define do
  #factory :product do
    #name { Faker::Product.product_name }
   # description:{ Faker::
   # price: rand(5..278),
   # quantity: rand(0..100)
    #image "MyString"
   # description "MyText"
 # end
#end

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