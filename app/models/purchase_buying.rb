class PurchaseBuying
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :shipping_area_id, :municipality, :street_number, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    # ３桁-４桁の正規表現
    validates :zip_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :shipping_area_id, numericality: { other_than: 0, message: 'select' }
    validates :municipality
    validates :street_number
    # 数字だけの正規表現
    validates :telephone_number, format: { with: /\A\d{11}\z/, message: 'Input only number' }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)    # 住所の情報を保存
    Buying.create(zip_code: zip_code, shipping_area_id: shipping_area_id, municipality: municipality, street_number: street_number, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end