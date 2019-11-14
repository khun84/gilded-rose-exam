require_relative '../lib/calculable'

RSpec.describe Calculable do
  class DummyClass
    include Calculable
  end

  let(:stubbed_calculator) { spy(run: 10) }
  let(:stubbed_calculators) { class_double(QualityCalculators, get_calculator: stubbed_calculator) }
  let(:calculation_ctx) { OpenStruct.new(type: :foo) }

  before { stub_const(QualityCalculators.to_s, stubbed_calculators) }
  subject { DummyClass.new.calculate_quality(calculation_ctx) }

  it 'should delegate calculation to dispatched calculator' do
    subject
    expect(stubbed_calculator).to have_received(:run).with(calculation_ctx)
  end
end
