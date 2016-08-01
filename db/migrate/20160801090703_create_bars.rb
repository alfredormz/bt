class CreateBars < ActiveRecord::Migration[5.0]
  def change
    create_table :bars do |t|
      t.string :yelp_id
      t.boolean :is_closed
      t.string :name
      t.string :image_url
      t.string :yelp_url
      t.string :phone
      t.integer :review_count
      t.string :categories
      t.float :rating
      t.text :snippet_text
      t.string :snippet_image_url
      t.decimal :latitude, precision: 10, scale: 7
      t.decimal :longitude, precision: 10, scale: 7
      t.string :address
      t.string :city
      t.string :neighborhoods
      t.string :postal_code

      t.timestamps
    end
  end
end
