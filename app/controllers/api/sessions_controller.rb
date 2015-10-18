module Api
  class SessionsController < ApplicationController
    # Before actions to check paramters
    before_action :session_params, only: [:do_login]

    def do_login
      # Find a user with params
      user = User.find_by(username: @credentials[:username])
      if user && user.authenticate(@credentials[:password])
        # Save them in the session
        render json: user
      else
        render plain: "{\"status\":\"400\",\"error\":\"Bad Request\"}", status: 400
      end
    end

    # Private controller methods
    private
    def session_params
      params.require(:credentials).permit(:password, :username)
      @credentials = params[:credentials]
    end

  end
end
