require 'ostruct'
require 'singleton'

class QualityCalculators
  include Singleton
  attr_reader :calculators

  def initialize
    @calculators = {}
  end

  def self.register(klass, type)
    instance.calculators[type] = klass
  end

  def self.calculators
    instance.calculators.values || []
  end

  def self.get_calculator(type)
    instance.calculators[type]
  end
end

Dir.glob(File.join(File.dirname(__FILE__), 'quality_calculator/*.rb')).each do |f|
  require f
end
