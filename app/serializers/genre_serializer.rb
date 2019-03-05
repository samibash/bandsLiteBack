class GenreSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :artist_genres
  has_many :artists, through: :artist_genres
end
