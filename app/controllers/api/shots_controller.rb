class Api::ShotsController < ApplicationController
  def index
    @shots = Shot.all
    render "index.json.jbuilder"
  end

  def show
    @shot = Shot.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def new
    render "new.json.jbuilder"
  end

  def create
    @shot = Shot.new(
      name: params[:name],
    )
    @shot.save
  end

  def destroy
    @shot = Shot.find_by(id: params[:id])
    @shot.destroy
  end
end
