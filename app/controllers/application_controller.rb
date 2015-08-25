class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  # before_filter :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user! , :except => [:home_page]
  # before_filter :configuration_status, :except => [:configuration, :code, :home_page, :cem_play_number, :destroy, :customer_care_details, :customer_response_message, :edit_customer_care]
  # before_filter :check_company_code, :only => [:configuration, :code]
  # before_filter :check_customer_details, :only => [:customer_care_details, :customer_response_message]
  protected
  def after_sign_in_path_for(resource)
    if current_user.role == "super_admin" && current_user.is_admin ==true
       users_path
    else
      home_combine_forms_path
      # unless current_user.configuration_status
      #   configuration_path
      # else
      #   tickets_path
      # end
    end
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname,:middlename,:lastname,:username,:email,
      :mobile_no,:address_1) }
  end

  def configuration_status
    if user_signed_in?
      if current_user.configuration_status == false
        redirect_to configuration_path
      end
    end
  end

  def is_super_admin
    if current_user.role != "super_admin" && current_user.is_admin != true
      redirect_to plans_path
    end
  end

  def super_admin?
    if current_user.role == "super_admin" && current_user.is_admin == true
      return true
    else
      return false
    end
  end

  def check_company_code
    if !current_user.code_name.blank? && !current_user.customer_care_code.blank?
      redirect_to customer_care_details_path
    end
  end

  def check_customer_details
    if !current_user.customer_care_number.blank? && !current_user.customer_care_email.blank?
      redirect_to plans_path
    end
  end
end
