class Api::V1::GenresController < ApplicationController
  before_action :find_genre, only: [:update]
  def index
    @genres = Genre.all
    render json: @genres
  end

  def update
    @genre.update(genre_params)
    if @genre.save
      render json: @genre, status: :accepted
    else
      render json: { errors: @genre.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def genre_params
    params.permit(:title, :content)
  end

  def find_genre
    @genre = Genre.find(params[:id])
  end
end
