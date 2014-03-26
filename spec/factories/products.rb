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
  factory :product do
    name "MyString"
    price 9.99
    quantity 1
    image "MyString.jpg"
    description "MyText"
    store { create(:store) }
  end
end
