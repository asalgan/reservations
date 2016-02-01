class Table < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :reservation

  enum table_type: [:two_person, :four_person, :six_person]

  # two_person:  5 tables
  # four_person: 2 tables
  # six_person:  1 table

  def self.at_capacity?(type, quantity)
    if (type.to_i == 0 && quantity.to_i == 5) || (type.to_i == 1 && quantity.to_i == 2) || (type.to_i == 2 && quantity.to_i == 1)
      true
    else
      false
    end
  end

end
