class AddPhotoToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :photo_url, :string
  end
end
