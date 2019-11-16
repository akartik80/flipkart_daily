class SearchLowestPrice
  def perform
    Variant.order(price: :desc)
  end
end
