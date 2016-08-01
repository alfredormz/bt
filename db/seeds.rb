# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

businesses = Yelp.client.search('Buenos Aires', { term: 'beer' }).businesses

businesses.each do |b|
  bar = Bar.find_or_initialize_by(yelp_id: b.id)  
  bar.name = b.id
  bar.image_url = b.image_url
  bar.yelp_url = b.url
  bar.phone = b.display_phone
  bar.review_count = b.review_count
  bar.is_closed = b.is_closed

  bar.categories = b.categories.join(", ")
  bar.rating     = b.rating

  bar.address    = b.location.address
  bar.city       = b.location.city
  bar.neighborhoods = b.location.neighborhoods.join(", ")
  bar.postal_code = b.location.postal_code 

  bar.latitude = b.location.coordinate.latitude
  bar.longitude = b.location.coordinate.longitude
  
  bar.save
end


