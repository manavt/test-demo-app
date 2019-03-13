class Api::UsersController < ApplicationController
  skip_before_action :verify_session

  def index
    @users = User.all
    respond_to do | format |
      format.json {render json: {body: @users, code: 200}}
    end
  end
  def create
    @user = User.new(user_params)
    respond_to do | format |
      if @user.save
        format.json {render json: {body: @user, code: 204, message: "Successfully added users"}}
      else
        format.json {render json: {body: @user.errors, code: 304, message: "OOPS! Try again!"}}
      end
    end
  end
  def update
    @user = User.find(params[:id])
    respond_to do | format |
      if @user.update_columns(user_params.to_h)
        format.json {render json: {body: @user, code: 204, message: "Successfully updated users"}}
      else
        format.json {render json: {body: @user.errors, code: 304, message: "OOPS! Try again!"}}
      end
    end
  end
  def destroy
      @user = User.find(params[:id])
      @user.delete
      respond_to do | format |
        format.json {render json: {message: "Deleted Successfully"}}
      end
  end
  protected
  def user_params
    params.require(:user).permit!
  end
end
