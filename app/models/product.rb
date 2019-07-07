class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: {in: 10..500 }

  def is_discounted?
    price.to_i < 10
  end

  def tax
    (price * 0.09).round(2)
  end

  def total
    price + tax
  end

  def usd
    "$#{price}"
  end
end
