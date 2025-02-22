class Api::V1::PostersController < ApplicationController
  def index
    if params[:sort] == "asc"
      posters = Poster.sort_by_asc
    elsif params[:sort] == "desc"
      posters = Poster.sort_by_desc
    else 
      posters = Poster.all
    end

    if params[:name].present?
      posters = posters.name_contains(params[:name])
    end

    if params[:min_price].present?
      posters = posters.min_price(params[:min_price])
    end

    if params[:max_price].present?
      posters = posters.max_price(params[:max_price])
    end

    render json: PosterSerializer.format_posters(posters)
  end
  
  def show
    poster = Poster.find(params[:id])
    render json: PosterSerializer.format_single(poster)
  end

  def create
    new_poster = Poster.create(poster_params)
    render json: PosterSerializer.format_single(new_poster)
  end

  def update
    updated_poster = Poster.update(params[:id], poster_params)
    render json: PosterSerializer.format_single(updated_poster)
  end

  def destroy
    marked_poster = Poster.find_by(id: params[:id])

    if marked_poster
      marked_poster.destroy
    end
  end

  private

  def poster_params
    params.require(:poster).permit(:name, :description, :price, :year, :vintage, :img_url)
  end
end