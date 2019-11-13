require_relative './quality_calculators'

module Calculable
  # New calculator is required to be registered in order to be fetch by caller
  QualityCalculators.register(QualityCalculator::Degradable, :degradable)
  QualityCalculators.register(QualityCalculator::Legendary, :legendary)
  QualityCalculators.register(QualityCalculator::SteppedIncreaseable, :stepped_increaseable)
  QualityCalculators.register(QualityCalculator::Increaseable, :increaseable)
  QualityCalculators.register(QualityCalculator::DoubleDegradable, :double_degradable)

  def dispatch_calculator(type)
    QualityCalculators.get_calculator(type)
  end
end
