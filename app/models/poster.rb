class Poster < ApplicationRecord
  def self.sort_by_asc
    Poster.order(created_at: :asc)
  end

  def self.sort_by_desc
    Poster.order(created_at: :desc)
  end

  def self.name_contains(query)
    where("name ILIKE ?", "%#{query}%")
  end

  def self.min_price(query)
    where("price >= #{query}")
  end
  
  def self.max_price(query)
    where("price <= #{query}")
  end
end