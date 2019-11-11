module QualityCalculator
  class Increaseable < Base
    def run
      quality = obj.quality + 1
      gteq_max_quality?(quality) ? max_quality : quality
    end
  end
end
