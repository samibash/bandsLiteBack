class Api::V1::ArtistsController < ApplicationController
  before_action :find_artist, only: [:update, :fetch]
  def index
    @artists = Artist.all
    render json: @artists

  end

  def show
    @artist = Artist.find(params[:id])
    render json: @artist


  end

  def update
    @artist.update(artist_params)
    if @artist.save
      render json: @artist, status: :accepted
    else
      render json: { errors: @artist.errors.full_messages }, status: :unprocessible_entity
    end
  end





  def create
    @artist = Artist.create(artist_params)


  end





  private

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.permit(:name,:id)
  end
end
