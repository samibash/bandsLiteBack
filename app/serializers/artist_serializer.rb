class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :genres, :events
  has_many :artist_genres
  has_many :genres, through: :artist_genres
  has_many :events
end
