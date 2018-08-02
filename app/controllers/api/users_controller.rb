class Api::UsersController < ApplicationController
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )

    @user.save
    render "show.json.jbuilder"

  end
end
