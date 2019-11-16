class StockItemService < BaseService
  def initialize(stock_item)
    self.stock_item = stock_item
  end

  def add_stock(count)
    self.count = self.count + count
    save!
  end

  private

  attr_accessor :stock_item
end
