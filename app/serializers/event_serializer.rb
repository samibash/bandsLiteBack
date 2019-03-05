class EventSerializer < ActiveModel::Serializer
  attributes :id, :venue_name, :country, :latitude, :longitude, :ticket_link, :status, :bands_in_town_link, :api_artist_id, :artist_id, :artist

    belongs_to :artist
end
