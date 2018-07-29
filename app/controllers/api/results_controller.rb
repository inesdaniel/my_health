class Api::ResultsController < ApplicationController
  def index
    @results = Shot.all 
    render "index.json.jbuilder"
  end
end
