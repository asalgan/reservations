class Restaurant < ActiveRecord::Base
  has_many :tables
  has_many :reservations

  def upcoming_reservations
    reservations.present? ? reservations.where('start_time > ?', Time.now) : nil
  end

  def create_table(reservation)
    case reservation.party_size
      when 1..2 then table = { table_type: 0, reservation: reservation }
      when 3..4 then table = { table_type: 1, reservation: reservation }
      when 5..6 then table = { table_type: 2, reservation: reservation }
    end

    tables.create(table)

  end

end
