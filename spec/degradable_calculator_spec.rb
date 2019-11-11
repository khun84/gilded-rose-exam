require_relative '../lib/../lib/quality_calculators'
require_relative '../lib/../lib/item'

RSpec.describe QualityCalculator::Degradable do
  describe '.run' do
    let(:item) { Item.new('foo', 5, 6) }
    let(:ctx) { double(obj: item) }

    subject { described_class.run(ctx) }

    it 'should return quality value reduced by 1' do
      expect(subject).to eq 5
    end

    context 'when quality is 0' do
      it 'should return quality value as 0' do
        item.quality = 0
        expect(subject).to eq 0
      end
    end

    context 'when sell_in period is less than 0' do
      it 'should return quality value reduced by 2' do
        item.sell_in = 0
        expect(subject).to eq 4
      end
    end
  end
end
