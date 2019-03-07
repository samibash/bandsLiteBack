class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :genres, :events, :image_url, :thumb_url, :facebook_page_url
  has_many :artist_genres
  has_many :genres, through: :artist_genres
  has_many :events
end
