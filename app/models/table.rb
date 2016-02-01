class Table < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :reservation

  enum table_type: [:two_person, :four_person, :six_person]

  # two_person(0): 5 tables; four_person(1): 2 tables; six_person(2): 1 table
  def self.at_capacity?(type, quantity)
    (type == 0 && quantity == 5) || (type == 1 && quantity == 2) || (type == 2 && quantity == 1)
  end

end
