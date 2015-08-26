# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  firstname              :string(255)      default(""), not null
#  lastname               :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  mobile_no              :string(255)      default(""), not null
#  address_1              :string(255)      default(""), not null
#  role                   :string(255)
#  is_admin               :boolean          default("0")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  configuration_status   :boolean          default("0")
#  code_name              :string(255)
#  customer_care_code     :string(255)
#  customer_care_number   :string(255)
#  customer_care_email    :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  company_name           :string(255)
#  is_active              :boolean          default("1")
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :tickets  
  has_many :pay_requests
  has_many :posts
  has_many :forum_comments
  
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, 
         :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  
  def password_match?
        self.errors[:password] << "can't be blank" if password.blank?
        self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
        self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
        password == password_confirmation && !password.blank?
  end
  
  # new function to set the password without knowing the current password used in our confirmation controller. 
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end
  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  # new function to provide access to protected method pending_any_confirmation
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end
  
  def password_required?
  # Password is required if it is being set, but not for new records
   if !persisted? 
     false
   else
     !password.nil? || !password_confirmation.nil?
   end
 end

  def self.from_omniauth_facebook(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.new(
          firstname:auth.info.first_name,
          lastname:auth.info.last_name,
          provider:auth.provider,
          uid:auth.uid,
          email:auth.info.email,
                          )
        user.skip_confirmation!
        user.save!
        user 
      end
       
    end
  end

  def self.from_omniauth_google(auth, signed_in_resource=nil)    
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        if auth.info.first_name != nil && auth.info.last_name != nil
          user = User.new(
            firstname:auth.info.first_name,
            lastname:auth.info.last_name,
            provider:auth.provider,
            uid:auth.uid,
            email:auth.info.email,
                            )
        else
          user = User.new(
            provider:auth.provider,
            uid:auth.uid,
            email:auth.info.email,
                            )
        end
        user.skip_confirmation!
        user.save!
        user
      end       
    end
  end
  
   def active_for_authentication?
    super && is_active==true
  end
   
  def inactive_message
    is_active==true ? super : :account_deactivated
  end

end
