require_relative '../lib/../lib/quality_calculators'
require_relative '../lib/../lib/item'

RSpec.describe QualityCalculator::SteppedIncreaseable do
  describe '.run' do
    let(:item) { Item.new('foo', 5, 20) }
    let(:ctx) { double(obj: item) }

    subject { described_class.run(ctx) }

    it 'should not return quality more than 50' do
      item.quality = 50
      expect(subject).to eq 50
    end

    context 'when sell in is greater than 11' do
      it 'should return quality increased by 1' do
        item.sell_in = 11
        expect(subject).to eq 21
      end
    end

    context 'when sell in is between 6 and 10' do
      it 'should return quality increased by 2' do
        item.sell_in = (6..10).to_a.sample(1).first
        expect(subject).to eq 22
      end
    end

    context 'when sell in is between 1 and 5' do
      it 'should return quality increased by 3' do
        item.sell_in = (1..5).to_a.sample(1).first
        expect(subject).to eq 23
      end
    end

    context 'when sell in is negative' do
      it 'should return quality as 0' do
        item.sell_in = 0
        expect(subject).to eq 0
      end
    end
  end
end
