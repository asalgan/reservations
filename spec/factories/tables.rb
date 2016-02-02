FactoryGirl.define do
  factory :table do
    association :restaurant
    table_type 2
  end
end
