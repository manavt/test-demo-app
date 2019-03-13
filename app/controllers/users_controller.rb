require 'csv'
class UsersController < ApplicationController

  skip_before_action :verify_session, only: [:sign_in, :authentication, :new, :create, :facebook]

  def index
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_image # has_one
  end
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailMailer.welcome(@user).deliver_now!
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :new
    end
  end
  def facebook
    user = User.omniauth(request.env['omniauth.auth'])
    if user
      session[:user_id] = user.id
      redirect_to users_path
    else
      redirect_to root_url
    end
  end
  def download_in_csv
    CSV.open("#{Rails.root}/public/users.csv", "w") do | csv |
      csv << User.column_names
      User.all.each do | user |
        csv << ActiveRecord::Base.connection.select_one("select * from users where id = #{user.id}").values
      end
    end
    send_file "#{Rails.root}/public/users.csv", :disposition=> "attachment"
  end
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
    end
  end
  def logout
    session[:user_id] = nil
    redirect_to users_path
  end
  def authentication
    @user = User.authenticate(params[:email], params[:password])
    unless @user.nil?
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to sign_in_users_path
    end
  end
  protected
  def user_params
    params.require(:user).permit!
  end
end

# {user: {name: 'name', :email: 'email'}}  form_for
# {{name: 'name', :email: 'email'}}  form_tag
