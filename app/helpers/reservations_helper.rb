module ReservationsHelper

  def self.table_type(party_size)

    case party_size
      when 1..2 then table_type = 0
      when 3..4 then table_type = 1
      when 5..6 then table_type = 2
    end

    table_type

  end

end
