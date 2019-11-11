require_relative '../lib/../lib/quality_calculators'
require_relative '../lib/../lib/item'

RSpec.describe QualityCalculator::Increaseable do
  describe '.run' do
    let(:sell_in) { 5 }
    let(:quality) { 20 }
    let(:item) { Item.new('foo', sell_in, quality) }
    let(:ctx) { double(obj: item) }

    subject { described_class.run(ctx) }

    it 'should return quality increased by 1' do
      expect(subject).to eq 21
    end

    context 'when quality reached maximum' do
      let(:quality) { 50 }
      it 'should return quality not greater than 50' do
        expect(subject).to eq 50
      end
    end
  end
end
