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
        end
    end
end