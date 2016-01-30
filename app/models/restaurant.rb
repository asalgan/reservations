class Restaurant < ActiveRecord::Base
  has_many :tables
  has_many :reservations

  def upcoming_reservations
    reservations.present? ? reservations.where('start_time > ?', Time.now) : nil
  end

end
