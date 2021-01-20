class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchases

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ctegory
  belongs_to :condtion
  belongs_to :burden
  belongs_to :shipping_area
  belongs_to :shipping_days

  with_options presence: true do
    # ジャンルの選択が「--」の時は保存できないようにする
    with_options numericality: { other_than: 0, message: 'select' } do
      validates :ctegory_id
      validates :condtion_id
      validates :burden_id
      validates :shipping_area_id
      validates :shipping_days_id
    end

    validates :product
    validates :explanation
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end
end
