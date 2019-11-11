require_relative '../lib/../lib/quality_calculators'
require_relative '../lib/../lib/item'

RSpec.describe QualityCalculator::Legendary do
  describe '.run' do
    let(:item) { Item.new('foo', 5, 100) }
    let(:ctx) { double(obj: item) }

    subject { described_class.run(ctx) }

    it 'should return the same quality value' do
      expect(subject).to eq 100
    end

    context 'when sell_in is less than 0' do
      it 'should return the same quality value' do
        item.sell_in = 0
        expect(subject).to eq 100
      end
    end

    it 'should not be bounded by max value' do
      item.quality = 10_000
      expect(subject).to eq 10_000
    end
  end
end
