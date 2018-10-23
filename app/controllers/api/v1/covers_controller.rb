class Api::V1::CoversController < ApplicationController
  def index
    cover = Cover.all
    render json: cover
  end

  def create
    cover = Cover.new(cover_params)
    cover.save
  end

  private
  def cover_params
    params.permit(:cover)
  end


end
