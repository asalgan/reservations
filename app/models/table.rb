class Table < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :reservation

  enum table_type: [:two_person, :four_person, :six_person]

  # two_person:  5 tables
  # four_person: 2 tables
  # six_person:  1 table

  def self.at_capacity?(types)
    table_type = types.first

    if (table_type.two_person? && types.count <= 5) || (table_type.four_person? && types.count <= 2) || (table_type.six_person? && types.count <= 1)
      true
    else
      false
    end
  end

end
