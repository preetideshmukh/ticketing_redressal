class TwitterController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :configuration_status
  
  def index
    unless TwitterOauthSetting.find_by_user_id(current_user.id).nil?
      redirect_to "/twitter_profile"
    end
  end

  def generate_twitter_oauth_url

    oauth_callback = "http://#{request.host}:#{request.port}/oauth_account"
    @consumer = OAuth::Consumer.new("2K763Dgw9y6oAOOLsegegkHW7","pwXauJeR628SL8DhgwikStNYykGCKoabISHI4ZUnKIxt2eSmNY", :site => "https://api.twitter.com")
    @request_token = @consumer.get_request_token(:oauth_callback => oauth_callback)

    session[:request_token] = @request_token
    redirect_to @request_token.authorize_url(:oauth_callback => oauth_callback)

  end


  def oauth_account
    if TwitterOauthSetting.find_by_user_id(current_user.id).nil?
      @request_token = session[:request_token]
      prepare_access_token(params[:oauth_token],params[:oauth_token_secret])
      @consumer = OAuth::Consumer.new(params[:oauth_token],params[:oauth_token_secret], :site => "https://api.twitter.com")
      Rails.logger.info"+++++++++++++++++++++++"
      Rails.logger.info("#{@request_token.inspect}")
      Rails.logger.info"+++++++++++++++++++++++"
      
      TwitterOauthSetting.create(atoken: @request_token["token"], asecret: @request_token["secret"], user_id: current_user.id)
      update_user_account()
    end
    redirect_to "/twitter_profile"
  end

  def twitter_profile
    logger.info("============params==========#{params.inspect}")
  	logger.info("======================#{get_client.inspect}")
    @user_timeline = $client1.user_timeline(count: 50)
    @home_timeline = $client1.home_timeline(count: 100)
  end

private

  def get_client
  account = Settings['twitter']    
   $client1 = Twitter::REST::Client.new do |config|
      config.consumer_key = account['consumer_key']
      config.consumer_secret  = account['consumer_secret']
      config.oauth_token = account['oauth_token']
     config.oauth_token_secret = account['oauth_token_secret']
    end
    Twitter::Client.new(
	  :oauth_token => TwitterOauthSetting.find_by_user_id(current_user.id).atoken,
	  :oauth_token_secret => TwitterOauthSetting.find_by_user_id(current_user.id).asecret
	)
  end

  def update_user_account
    user_twitter_profile = get_client.user
    current_user.update_attributes({
      name: user_twitter_profile.name, 
      screen_name: user_twitter_profile.screen_name, 
      url: user_twitter_profile.url, 
      profile_image_url: user_twitter_profile.profile_image_url, 
      location: user_twitter_profile.location, 
      description: user_twitter_profile.description
    })
  end

  def prepare_access_token(oauth_token, oauth_token_secret)
      #consumer = OAuth::Consumer.new("APIKey", "APISecret", { :site => "https://api.twitter.com", :scheme => :header })
      @consumer = OAuth::Consumer.new("2K763Dgw9y6oAOOLsegegkHW7","pwXauJeR628SL8DhgwikStNYykGCKoabISHI4ZUnKIxt2eSmNY", { :site => "https://api.twitter.com", :scheme => :header })

      # now create the access token object from passed values
      token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
      access_token = OAuth::AccessToken.from_hash(@consumer, token_hash )

      return access_token
  end
end
