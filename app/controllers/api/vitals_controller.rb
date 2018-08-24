class Api::VitalsController < ApplicationController
  def index
    @vitals = Vital.all
    render "index.json.jbuilder"
  end

  def show
    @vital = Vital.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def new
    render "new.json.jbuilder"
  end   

  def create
    @vital = Vital.new(
      name: params[:name],
    )
    @vital.save
  end

  def destroy
    @vital = Vital.find_by(id: params[:id])
    @vital.destroy
  end
end
