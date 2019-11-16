class AddInventory
  def perform(category_name, brand_name, quantity, price, rating)
    category = Category.find_or_create_by!(name: category_name)
    brand = Brand.find_or_create_by!(name: brand_name)

    stock_location = StockLocation.first # defaulting to first for now

    product = Product.find_or_create_by!(category: category, brand: brand, name: "#{category.name} #{brand.name}")
    sku = product.name # keeping name for now but should be different
    variant = Variant.find_or_create_by!(product: product, sku: sku, price: price, rating: rating) if variant.blank?

    stock_item = StockItem.find_or_create_by!(stock_location: stock_location, variant: variant)
    stock_item_service(stock_item).add_stock(quantity)
  end

  private

  def stock_item_service(stock_item)
    StockItemService.new(stock_item)
  end
end
