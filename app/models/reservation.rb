class Reservation < ActiveRecord::Base
  belongs_to :restaurant

  validates :start_time, presence: true
  validates :name, presence: true
  validates :party_size, presence: true
end
