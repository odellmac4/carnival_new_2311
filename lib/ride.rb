class Ride

    attr_reader :name, 
                :min_height, 
                :admission_fee, 
                :excitement, 
                :total_revenue,
                :rider_log

    def initialize(info)
        @name = info[:name]
        @min_height = info[:min_height]
        @admission_fee = info[:admission_fee]
        @excitement = info[:excitement]
        @total_revenue = 0
        @rider_log = Hash.new { |h_obj, k| h_obj[k] = 0 }
    end

    def board_rider(visitor)

        if visitor.preferences.include?(@excitement)
            @rider_log[visitor] += 1
            visitor.spending_money = reduce_spending(visitor)
            change_revenue
        end
    end

    def reduce_spending(visitor)
        visitor.spending_money = (visitor.spending_money - @admission_fee)
    end

    def change_revenue
        @total_revenue += @admission_fee
    end

end