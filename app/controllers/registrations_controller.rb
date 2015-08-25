class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :configuration_status
  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if update_resource(@user, account_update_params)
      flash[:success] = t 'devise.registrations.updated'
      redirect_to tickets_path
    else
      if !params[:user][:firstname].blank?
        render('edit')
      else
        render('edit_customer_care')
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :email, :mobile_no, :address_1)
  end

  def account_update_params
    params.require(:user).permit(:firstname, :lastname, :email, :mobile_no, :address_1, :password,
                                 :password_confirmation, :current_password, :customer_care_email, :customer_care_number)
  end
end
