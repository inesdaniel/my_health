class Api::LabTestsController < ApplicationController
  def index
    @lab_tests = LabTest.all
    render "index.json.jbuilder"
  end

  def show
    @lab_test = LabTest.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def new
    render "new.json.jbuilder"
  end   

  def create
    @lab_test = LabTest.new(
      name: params[:name],
    )
    @lab_test.save
  end

  def destroy
    @lab_test = LabTest.find_by(id: params[:id])
    @lab_test.destroy
  end
end
