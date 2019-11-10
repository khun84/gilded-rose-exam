module QualityCalculator
  class Base
    attr_reader :ctx

    def self.run(ctx)
      new(ctx).run
    end

    def initialize(ctx)
      @ctx = ctx
    end

    def run
      raise NotImplementedError
    end

    private

    def min_quality
      0
    end

    def max_quality
      50
    end

    def lteq_min_quality?(val)
      val <= min_quality
    end

    def gteq_max_quality?(val)
      val >= max_quality
    end

    def obj
      ctx.obj
    end
  end
end
