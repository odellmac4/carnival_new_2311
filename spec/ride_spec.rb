require 'spec_helper'

RSpec.describe Ride do
    before(:each) do
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')

    end

    describe 'ride' do
      it 'is a ride ' do
        expect(@ride1).to be_an_instance_of (Ride)
      end
  
      it 'has a name' do
        expect(@ride1.name).to eq ("Carousel")
      end
  
      it 'has an admission fee' do
        expect(@ride1.admission_fee).to eq (1)
      end

      it 'has a minimum height requirement' do
        expect(@ride1.min_height).to eq (24)
      end

      it 'has a minimum height requirement' do
        expect(@ride1.excitement).to eq (:gentle)
      end

      it 'total revenue defaults to 0' do
        expect(@ride1.total_revenue).to eq (0)
      end
    end

    describe '#board_rider and #rider_log' do
        it 'visitor is a rider on the ride and ride logs riders' do
            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)
            @ride1.board_rider(@visitor1)
            
            expect(@ride1.rider_log).to eq({
                @visitor1 => 2,
                @visitor2 => 1 
            })
        end

        it 'subtracts admission fee from visitor spending money' do
            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)
            @ride1.board_rider(@visitor1)

            expect(@visitor1.spending_money).to eq (8)
            expect(@visitor2.spending_money).to eq (4)
            
            expect(@ride1.total_revenue).to eq (3)

        end
    end
end
  