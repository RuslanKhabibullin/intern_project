class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.persisted? ? valid_user : invalid_user
  end

  def valid_user
    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Google"
    sign_in_and_redirect @user, event: :authentication
  end

  def invalid_user
    session["devise.google_data"] = request.env["omniauth.auth"]
    redirect_to new_user_registration_url, alert: @user.errors.full_messages.to_sentence
  end
end
