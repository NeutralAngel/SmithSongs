class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :stripe_token
      t.string :ship_line1
      t.string :ship_line2
      t.string :ship_city
      t.string :ship_state
      t.string :ship_zip
      
      t.timestamps
    end
  end
end
