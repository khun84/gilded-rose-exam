require_relative '../lib/../lib/quality_calculators'
require_relative '../lib/../lib/item'

RSpec.describe QualityCalculator::SteppedIncreaseable do
  describe '.run' do
    let(:sell_in) { 5 }
    let(:quality) { 20 }
    let(:item) { Item.new('foo', sell_in, quality) }
    let(:ctx) { double(obj: item) }

    subject { described_class.run(ctx) }

    context 'when quality reached maximum' do
      let(:quality) { 50 }
      it 'should not return quality more than 50' do
        expect(subject).to eq 50
      end
    end

    context 'when sell in is greater than 11' do
      let(:sell_in) { 11 }
      it 'should return quality increased by 1' do
        expect(subject).to eq 21
      end
    end

    context 'when sell in is between 6 and 10' do
      let(:sell_in) { (6..10).to_a.sample(1).first }
      it 'should return quality increased by 2' do
        expect(subject).to eq 22
      end
    end

    context 'when sell in is between 1 and 5' do
      let(:sell_in) { (1..5).to_a.sample(1).first }
      it 'should return quality increased by 3' do
        expect(subject).to eq 23
      end
    end

    context 'when sell in is negative' do
      let(:sell_in) { 0 }
      it 'should return quality as 0' do
        expect(subject).to eq 0
      end
    end
  end
end
