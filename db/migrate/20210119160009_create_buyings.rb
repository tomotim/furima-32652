class CreateBuyings < ActiveRecord::Migration[6.0]
  def change
    create_table :buyings do |t|
      t.string     :zip_code,          null: false
      t.integer    :shipping_area_id,  null: false
      t.string     :municipality,      null: false
      t.string     :street_number,     null: false
      t.string     :building_name
      t.string     :telephone_number,  null: false
      t.references :purchase,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
