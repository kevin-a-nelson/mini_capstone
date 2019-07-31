class Product < ApplicationRecord
  belongs_to :supplier
  has_many :orders, through: :carted_products
  has_many :images
  has_many :product_categorys
  has_many :categories, through: :product_categorys

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  def images
    Images.find_by(id: 1).url
  end

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

  def image
      return 'https://sterlingcomputers.com/wp-content/themes/Sterling/images/no-image-found-360x260.png'
  end
end
