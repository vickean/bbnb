class SessionsController < Clearance::SessionsController

  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    #byebug
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
    if authentication.user
      user = authentication.user
      authentication.update_token(auth_hash)
      @next = root_url
      @notice = "Signed in as #{auth_hash["info"]["first_name"]} #{auth_hash["info"]["last_name"]}!"
    else
      user = User.create_with_auth_and_hash(authentication,auth_hash)
      @next = edit_user_path(user)
      @notice = "User created - confirm or edit details..."
    end
    sign_in(user)
    redirect_to @next, :notice => @notice
  end

  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        flash.notice = "Signed in as #{@user.firstname} #{@user.lastname}!"
        redirect_to root_url
      else
        flash.now.notice = status.failure_message
        render template: "sessions/new", status: :unauthorized
      end
    end
  end

end
