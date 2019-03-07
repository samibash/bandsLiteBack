class EventSerializer < ActiveModel::Serializer
  attributes :id, :venue_name, :country, :latitude, :longitude, :ticket_link, :status, :bands_in_town_link, :api_artist_id, :artist_id, :artist, :user_events, :date_time

    belongs_to :artist
    has_many :user_events
    has_many :users, through: :user_events
end
