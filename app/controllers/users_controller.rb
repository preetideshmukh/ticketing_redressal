class UsersController < ApplicationController
layout 'admin'
skip_before_filter :configuration_status
  def index
  	@search = User.ransack(params[:q])
    @users = @search.result.paginate(:page => params[:page], :per_page =>5).where(is_admin: false)
    @search.build_condition
    @search.build_sort if @search.sorts.empty?
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] =t 'devise.registrations.updated'
      redirect_to users_path
    else
      render "edit"
    end
  end

  def destroy
  	@user = User.find(params[:id])
    @user.destroy!
    redirect_to users_path, :notice => "Your patient has been deleted"
  end
  
  def deactivate
    @user = User.find(params[:id])
    @user.update_attributes(:is_active => false)
    redirect_to users_path, :notice => "Your client account has been deactivated"
  end

  def activate
    @user = User.find(params[:id])
    @user.update_attributes(:is_active => true)
    redirect_to users_path, :notice => "Your client account has been activated"
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :mobile_no, :address_1)
  end
end
