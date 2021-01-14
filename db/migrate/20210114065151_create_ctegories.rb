class CreateCtegories < ActiveRecord::Migration[6.0]
  def change
    create_table :ctegories do |t|

      t.timestamps
    end
  end
end
