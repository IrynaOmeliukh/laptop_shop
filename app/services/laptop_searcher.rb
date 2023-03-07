class LaptopSearcher
  def self.search(query)
    if query.present?
      Laptop.search(query)
    else
      Laptop.all
    end
  end
end
