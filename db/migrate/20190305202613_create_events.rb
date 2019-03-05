class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :venue_name
      t.string :country
      t.string :latitude
      t.string :longitude
      t.string :ticket_link
      t.string :status
      t.string :bands_in_town_link
      t.string :api_artist_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
