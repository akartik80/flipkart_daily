class CartService
  def initialize(cart = nil, user = nil)
    raise ArgumentError.new('One of user or cart is required') if user.blank? && cart.blank?

    self.cart = cart || user.cart || Cart.create!(user: user)
  end

  def add(variant, count)
    cart_item = cart_items.find_or_create_by!(variant: variant)
    cart_item.increment!(count: count)
  end

  private

  attr_accessor :cart
end
