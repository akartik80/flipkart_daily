class Variant < ApplicationRecord
  belongs_to :product
  has_many :stock_items

  def count
    stock_items.sum(:count)
  end

  def available?(count = 1)
    count <= self.count
  end

  def unavailable?(count = 1)
    !available?(count)
  end

  def process_for_cart(count)
    raise Standard.new('Not enough items in inventory') if count > self.count

    selected_stock_items = stock_items.where('count > 0')
    count_to_subtract = count

    selected_stock_items.each do |stock_item|
      break if count_to_subtract <= 0
      min_count = [stock_item.count, count_to_subtract].min
      stock_item.decrement!(:count, min_count)
      count_to_subtract = count_to_subtract - min_count
    end
  end
end
