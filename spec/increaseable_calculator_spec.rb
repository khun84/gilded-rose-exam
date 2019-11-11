require_relative '../lib/../lib/quality_calculators'
require_relative '../lib/../lib/item'

RSpec.describe QualityCalculator::Increaseable do
  describe '.run' do
    let(:item) { Item.new('foo', 5, 20) }
    let(:ctx) { double(obj: item) }

    subject { described_class.run(ctx) }

    it 'should return quality increased by 1' do
      expect(subject).to eq 21
    end

    it 'should return quality not greater than 50' do
      item.quality = 50
      expect(subject).to eq 50
    end
  end
end
