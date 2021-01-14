class Item < ApplicationRecord
  validates :product,          presence: true
  validates :explanation,      presence: true
  validates :ctegory_id,       presence: true
  validates :condtion_id,      presence: true
  validates :burden_id,        presence: true
  validates :shipping_area_id, presence: true
  validates :shipping_days_id, presence: true
  validates :price,            presence: true
 
  belongs_to :user
  has_one_attached :image
end
