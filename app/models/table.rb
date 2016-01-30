class Table < ActiveRecord::Base
  belongs_to :restaurant

  enum table_type: [:two_person, :four_person, :six_person]
end
