class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_filter :store_location
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user! , :except => [:home_page]
  before_filter :configuration_status, :except => [:combine_forms, :home_page, :destroy, :customer_response_message, :edit_customer_care, :super_admin?]  
  before_filter :customer_details_filled, :only => [:combine_forms]
  # before_filter :check_customer_details, :only => [:customer_care_details, :customer_response_message]
  protected
  def after_sign_in_path_for(resource)
    if super_admin?
       session[:previous_url] || users_path    
    else
      if current_user.configuration_status != true
        if current_user.code_name.blank?
          home_combine_forms_path
        else
          plans_path
        end
      else
        session[:previous_url] || tickets_path
      end
    end
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname,:middlename,:lastname,:username,:email,
      :mobile_no,:address_1) }
  end
#######check for configuration status
  def configuration_status
    if user_signed_in? && !super_admin?
      if current_user.configuration_status == false        
        if current_user.code_name.blank?
          redirect_to home_combine_forms_path
        else
          redirect_to plans_path
        end      
      end
    end
  end

########### returns true or false for admin
  def super_admin?
    if current_user.role == "super_admin" && current_user.is_admin == true
      return true
    else
      return false
    end
  end 
  
############ check for code_name not blank
  def customer_details_filled
    if !current_user.code_name.blank?
      flash[:success] = 'You already registered your company with us. You cannot repeat the process.'
      redirect_to tickets_path
    end
  end  
  
  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/    
  end
end
