class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product,           null: false
      t.text       :explanation,       null: false
      t.integer    :ctegory_id,        null: false
      t.integer    :condtion_id,       null: false
      t.integer    :burden_id,         null: false
      t.integer    :shipping_area_id,  null: false
      t.integer    :shipping_days_id,  null: false
      t.integer    :price,             null: false
      t.references :user,              foreign_key: true
      t.timestamps
    end
  end
end
