require_relative '../lib/../lib/quality_calculators'

RSpec.describe QualityCalculators do
  class DummyCalculator; end

  describe 'register calculator' do
    it 'should be able to register new calculator' do
      described_class.register(DummyCalculator, :dummy)
      expect(described_class.calculators).to include(DummyCalculator)
    end
  end

  describe '#get_calculator' do
    before do
      described_class.register(DummyCalculator, :dummy)
    end
    it 'return correct calculator by type' do
      expect(described_class.get_calculator(:dummy)).to eq DummyCalculator
    end
  end
end