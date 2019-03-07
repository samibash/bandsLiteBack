require "rest-client"
require_relative "../api_key.rb/"
require "faker"

Event.destroy_all
Artist.destroy_all
Genre.destroy_all

Artist.create(name: "Louis Cole")
Artist.create(name: "Knower")
Artist.create(name: "Ravi Coltrane")
Artist.create(name: "Little Feat")
Artist.create(name: "Randy Brecker")


5.times do
  Genre.create(name: Faker::Music.genre)
end

Artist.all.each do |artist|
  ArtistGenre.create(artist_id: artist.id, genre_id: Genre.all.sample.id)
end

def getArtistUpcomingEvents(artistname)
JSON.parse(RestClient.get("https://rest.bandsintown.com/artists/#{artistname.delete(' ')}/events?app_id=#{api_key}&date=upcoming"))
end

Artist.all.each do |artist|
  response = getArtistUpcomingEvents(artist.name)

  response.each do |r|

    Event.create(venue_name: r["venue"]["name"]  ,country: r["venue"]["country"] ,latitude: r["venue"]["latitude"], longitude: r["venue"]["longitude"], ticket_link: r["offers"][0]["url"], status: r["offers"][0]["status"], bands_in_town_link: r["url"], api_artist_id: r["id"],  artist_id: artist.id)

  end

end

User.create(name: "Olaf")

UserEvent.create(user_id: User.all.sample.id, event_id: Event.all.sample.id)
