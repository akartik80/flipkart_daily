class StockItemService < BaseService
  def initialize(stock_item)
    self.stock_item = stock_item
  end

  def add_stock(count)
    stock_item.increment!(:count, count)
  end

  private

  attr_accessor :stock_item
end
