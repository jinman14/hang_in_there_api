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
end