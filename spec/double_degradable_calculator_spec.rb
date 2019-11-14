require_relative '../lib/../lib/quality_calculators'
require_relative '../lib/../lib/item'

RSpec.describe QualityCalculator::DoubleDegradable do
  describe '.run' do
    let(:sell_in) { 5 }
    let(:quality) { 6 }
    let(:item) { Item.new('foo', sell_in, quality) }
    let(:ctx) { double(obj: item) }

    subject { described_class.run(ctx) }

    it 'should return quality value reduced by 2' do
      expect(subject).to eq 4
    end

    context 'when quality is 0' do
      let(:quality) { 0 }
      it 'should return quality value as 0' do
        expect(subject).to eq 0
      end
    end

    context 'when sell_in period is less than 0' do
      let(:sell_in) { 0 }
      it 'should return quality value reduced by 2 time faster' do
        expect(subject).to eq 2
      end
    end
  end
end
