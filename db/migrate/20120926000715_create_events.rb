class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :venue_id
      t.boolean :steve_show
      t.date :event_date
      t.datetime :begin_time
      t.datetime :end_time
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
