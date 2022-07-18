class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :ship_day

  validates :title, :content, :price, presence: true

  validates :category_id, :condition_id, :charge_id, :prefecture_id, :ship_day_id, numericality: { other_than: 1 , message: "can't be blank" } 
end
