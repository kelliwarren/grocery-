# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user { create(:user) }
    store { create(:store) }
  end
end
