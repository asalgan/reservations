class Reservation < ActiveRecord::Base
  belongs_to :restaurant

  validates :start_time, presence: true
  validates :name, presence: true
  validates :party_size, presence: true
  validate  :not_past
  validate  :has_available_seating

  def not_past
    if start_time.past?
      errors.add :start_time, "cannot be in past"
    end
  end

  def has_available_seating

  end

end
