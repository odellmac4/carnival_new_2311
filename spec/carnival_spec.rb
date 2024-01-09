require 'spec_helper'

RSpec.describe Carnival do
    before(:each) do
        @carnival = Carnival.new(14)
        @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')
    end

    describe 'Carnival' do
      it 'is a carnival ' do
        expect(@carnival).to be_an_instance_of (Carnival)
      end
    end

    describe 'carnival rides' do

        it 'has rides' do
            expect(@carnival.rides).to eq([])
        end

        it 'adds rides to carnival' do
            expect(@carnival.add_ride(@ride3)).to eq ([@ride3])
        end

        it 'has popular rides' do
            @carnival.add_ride(@ride2)
            @carnival.add_ride(@ride3)

            @ride2.board_rider(@visitor1)
        end
    end
end