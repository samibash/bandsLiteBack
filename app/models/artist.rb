require_relative "../../api_key.rb/"

class Artist < ApplicationRecord
  has_many :artist_genres
  has_many :genres, through: :artist_genres
  has_many :events
 
    def getEvents
      filtered_name = self.name.downcase.delete(' ')

      response = JSON.parse(RestClient.get("https://rest.bandsintown.com/artists/#{filtered_name}/events?app_id=#{api_key}&date=upcoming"))

      response.each do |r|

      Event.create(venue_name: r["venue"]["name"]  ,country: r["venue"]["country"] ,latitude: r["venue"]["latitude"], longitude: r["venue"]["longitude"], ticket_link: r["offers"][0]["url"], status: r["offers"][0]["status"], bands_in_town_link: r["url"], api_artist_id: r["id"],  artist_id: self.id, date_time: r["datetime"])

      end

     
   
    end

     def getDetails
        filtered_name = self.name.downcase.delete(' ')

        r = JSON.parse(RestClient.get("https://rest.bandsintown.com/artists/#{filtered_name}/?app_id=#{api_key}"))

        puts("response is this: #{r} ")
        artist = self
        artist.url = r["url"]
        artist.image_url = r["image_url"]
        artist.thumb_url = r["thumb_url"]
        artist.facebook_page_url = r["facebook_page_url"]
        artist.save
      end

end
