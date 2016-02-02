FactoryGirl.define do
  factory :reservation do
    association :restaurant
    association :table
    start_time (Time.now+5.days).beginning_of_hour
    name "Bob"
    party_size 4
  end

  factory :six_person_reservation, parent: :reservation do
    party_size 6
  end

end
