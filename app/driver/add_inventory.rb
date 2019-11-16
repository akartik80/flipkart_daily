class AddInventory
  def perform(category_name, brand_name, quantity, price, rating)
    category = Category.find_by(name: category_name)
    category = Category.create!(name: category_name) if category.blank?

    brand = Brand.find_by(name: brand_name)
    brand = Brand.create!(name: brand) if brand.blank?

    stocl
  end
end