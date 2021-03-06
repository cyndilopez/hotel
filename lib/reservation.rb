module Hotel
  class Reservation
    attr_reader :id, :start_date, :end_date, :room, :total_cost, :block_id, :discount

    def initialize(id:, start_date:, end_date:, room:, total_cost: nil, block_id: nil, discount: nil)
      @id = id
      @start_date = start_date
      @end_date = end_date
      raise ArgumentError if end_date <= start_date
      @room = room
      @block_id = block_id
      @discount = discount
      @total_cost = calc_total_cost
    end

    def calc_total_cost
      cost = (end_date - start_date).to_i * room.cost
      if !block_id.nil?
        cost = cost - cost * discount
      end
      return cost
    end
  end
end
