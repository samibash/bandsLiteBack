require_relative "../../api_key.rb/"

class Artist < ApplicationRecord
  has_many :artist_genres
  has_many :genres, through: :artist_genres
  has_many :events
 
    def getEvents
      filtered_name = self.name.downcase

      response = JSON.parse(RestClient.get("https://rest.bandsintown.com/artists/#{self.name.delete(' ')}/events?app_id=#{api_key}&date=upcoming"))

      response.each do |r|

      Event.create(venue_name: r["venue"]["name"]  ,country: r["venue"]["country"] ,latitude: r["venue"]["latitude"], longitude: r["venue"]["longitude"], ticket_link: r["offers"][0]["url"], status: r["offers"][0]["status"], bands_in_town_link: r["url"], api_artist_id: r["id"],  artist_id: self.id)

      end
   
end



end
