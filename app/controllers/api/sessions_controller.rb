module Api
  class SessionsController < ApplicationController
    # Before actions to check paramters
    before_action :session_params, only: [:do_login]

    def index
      render plain: "{\"title\":\"Colosseo API page\",\"documentation\":\"https://github.com/seacen/Colosseo\",\"source_link\":\"https://github.com/seacen/Colosseo\"}", status: 200, content_type: 'application/json'
    end

    def do_login
      # Find a user with params
      user = User.find_by(username: @credentials[:username])
      if user && user.authenticate(@credentials[:password])
        # Save them in the session
        render json: user, serializer: SessionSerializer
      else
        render plain: "{\"error\":\"Login Failed\"}", status: 400, content_type: 'application/json'
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
