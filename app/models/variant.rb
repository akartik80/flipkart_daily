class Variant < ApplicationRecord
  belongs_to :product
  has_many :stock_items

  def count
    stock_items.sum(:count)
  end
end
