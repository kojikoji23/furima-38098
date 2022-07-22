class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to :prefecture

  validates :city, :address, presence: true
  validates :zip, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :tel, presence: true, format: { with: ^0\d{10,11}$, message: 'is invalid' }
end
