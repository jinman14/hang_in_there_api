class Api::V1::PostersController < ApplicationController
  def index
    render json: Poster.all
  end

  def show
    render json: Poster.find(params[:id])
  end

  def create
    render json: Poster.create
  end

  def update
    render json: Poster.update
  end

  def destroy
    render json: Poster.delete
  end
end