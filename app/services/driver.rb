class Driver
  def perform
    AddInventory.new.perform('Chargers', 'Apple', 20, 1000, 5)
    AddInventory.new.perform('Milk', 'Amul', 20, 1000, 5)

    SearchAvailability.new.perform
    SearchLowestPrice.new.perform

    user = User.create!(name: :user1)
    brand = Brand.find_by!(name: 'Apple')
    category = Category.find_by(name: 'Chargers')
    product = Product.find_by!(brand: brand, category: category)
    variant = product.variants.first # only 1 variant for now

    CartService.new(user: user).add(variant, 10)
    CartService.new(user: user).add(variant, 20)

    CartService.new(user: user).get_cart_items
  end
end
