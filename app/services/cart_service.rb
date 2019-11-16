class CartService
  def initialize(cart: nil, user: nil)
    raise ArgumentError.new('One of user or cart is required') if user.blank? && cart.blank?

    self.cart = cart || user.cart || Cart.create!(user: user)
  end

  def add(variant, count)
    raise StandardError.new("Variant #{variant.sku} has only #{variant.count} items available") if variant.unavailable?(count)

    ActiveRecord::Base.transaction do
      cart_item = cart.cart_items.find_or_create_by!(variant: variant)
      cart_item.update_attributes!(count: (cart_item.count.presence || 0) + count)
      variant.process_for_cart(count)
    end
  end

  def get_cart_items
    cart.cart_items
  end

  private

  attr_accessor :cart
end
