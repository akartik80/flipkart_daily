class SearchAvailability
  def perform
    Variant.select { |v| v.count > 0 }
  end
end
