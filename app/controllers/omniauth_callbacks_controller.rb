class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    auth()
  end

  def facebook
    auth()
  end

  def google_oauth2
    auth()
  end

  private

  def auth
    omni = request.env["omniauth.auth"]
    authentication = Authentication.where(:provider => omni['provider'],:uid  => omni['uid']).first
    if authentication
      flash[:notice] = "Logged in Successfully"
      @user =  User.find(authentication.user_id)
      sign_in_and_redirect @user, :event => :authentication
    elsif current_user
      Authentication.create!(:provider => omni['provider'], :uid => omni['uid'], :token => omni['credentials'].token, :token_secret => omni['credentials'].secret,:user_id => current_user.id)
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_user
    else
      @user = User.where("email" => omni['info'].email).first
      if @user.nil?
        @user = User.new
        @user.email = omni['info'].email unless omni['info'].email.blank?
      end
      @user.apply_omniauth(omni)
      @user.skip_confirmation!

      if @user.new_record?
        if @user.save(:validate => false)
          flash[:notice] = "Logged in."
          Authentication.create!(:provider => omni['provider'], :uid => omni['uid'], :token => omni['credentials'].token, :token_secret => omni['credentials'].secret,:user_id => @user.id)
          sign_in_and_redirect User.find(@user.id)
        else
          session[:omniauth] = omni.except('extra')
          redirect_to new_user_registration_path
        end
      else
        Authentication.create!(:provider => omni['provider'], :uid => omni['uid'], :token => omni['credentials'].token, :token_secret => omni['credentials'].secret,:user_id => @user.id)
        sign_in_and_redirect User.find(@user.id)
      end
    end
  end

end