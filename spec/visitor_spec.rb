require 'spec_helper'

RSpec.describe Visitor do
    before(:each) do
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')
    end

    describe 'visitor' do
      it 'is a visitor' do
        expect(@visitor1).to be_an_instance_of (Visitor)
      end
  
      it 'has a name' do
        expect(@visitor1.name).to eq ("Bruce")
      end
  
      it 'defaults to having no ship' do
        expect(@visitor1.height).to eq (54)
      end
  
      it 'defaults to being empty' do
        expect(@visitor1.spending_money).to eq (10)
      end
    end

    describe '#add_preferences' do
        it 'adds preferences' do
            @visitor1.add_preference(:gentle)
            @visitor1.add_preference(:thrilling)
            expect(@visitor1.preferences).to eq ([:gentle, :thrilling])
        end
    end

    describe '#tall_enough?' do
        it 'is visitor tall enough based on height threshold' do
            expect(@visitor1.tall_enough?(54)).to eq (true)
            expect(@visitor2.tall_enough?(54)).to eq (false)
            expect(@visitor3.tall_enough?(54)).to eq (true)
            expect(@visitor1.tall_enough?(64)).to eq (false)
        end
    end
end