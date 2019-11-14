module QualityCalculator
  class SteppedIncreaseable < Base
    def run
      return 0 if obj.sell_in <= 0
      increment = if obj.sell_in > 5 && obj.sell_in <= 10
                    2
                  elsif obj.sell_in > 0 && obj.sell_in <= 5
                    3
                  else
                    1
                  end
      quality = obj.quality + increment
      gteq_max_quality?(quality) ? max_quality : quality
    end
  end
end
