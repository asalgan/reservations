class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :table

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

    case party_size
      when 1..2 then table_type = "two_person"
      when 3..4 then table_type = "four_person"
      when 5..6 then table_type = "six_person"
    end

    same_types = Reservation.where(start_time: start_time).collect(&:table).select {|x| x.table_type == table_type }

    unless same_types.nil?
      has_room = Table.at_capacity?(same_types)

      if has_room == false
        errors.add :party_size, "cannot be seated at this time, please select another timeslot."
      end

    end

  end


end
