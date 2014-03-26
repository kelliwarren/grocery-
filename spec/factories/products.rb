# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    price 9.99
    quantity 1
    image "MyString"
    description "MyText"
  end
end
