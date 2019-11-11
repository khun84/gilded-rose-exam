module QualityCalculator
  class Degradable < Base
    def run
      decrement = sell_in_passed? ? base_decrement * 2 : base_decrement
      quality = obj.quality - decrement
      lteq_min_quality?(quality) ? min_quality : quality
    end

    private

    def base_decrement
      1
    end

    def sell_in_passed?
      obj.sell_in - 1 < 0
    end
  end
end
