class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :bio
      t.string :url
      t.string :image_url
      t.string :thumb_url
      t.string :facebook_page_url
      


      t.timestamps
    end
  end
end
