require 'ostruct'
require_relative 'calculable'

class GildedRose
  include Calculable

  DEFAULT_QUALITY_TYPE = :degradable
  QUALITY_TYPE_MAPPER = {
    "Backstage passes to a TAFKAL80ETC concert" => :stepped_increaseable,
    "Sulfuras, Hand of Ragnaros" => :legendary,
    "Aged Brie" => :increaseable,
    "Conjured" => :double_degradable
  }.freeze

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      update_ctx = build_update_ctx(item)
      calculator = dispatch_calculator(update_ctx.type)
      new_quality = calculator.run(update_ctx)
      refresh_sell_in(update_ctx)
      refresh_quality(update_ctx, new_quality)
    end
  end

  private

  def build_update_ctx(item)
    OpenStruct.new(
      obj: item,
      type: QUALITY_TYPE_MAPPER[item.name] || DEFAULT_QUALITY_TYPE
    )
  end

  def refresh_sell_in(ctx)
    return if ctx.type == :legendary
    ctx.obj.sell_in -= 1
  end

  def refresh_quality(ctx, val)
    ctx.obj.quality = val
  end
end
