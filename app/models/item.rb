class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :ship_day
  has_one_attached :image
  belongs_to :user

  validates :title, :content, :image, presence: true

  validates :category_id, :condition_id, :charge_id, :prefecture_id, :ship_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }
end
