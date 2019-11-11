module QualityCalculator
  class DoubleDegradable < Degradable
    def base_decrement
      super * 2
    end
  end
end
