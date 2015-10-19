module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update]
      before_action :authenticate, only: [:show, :update]
      before_action :check_valid, only: [:show, :update]
      respond_to :json

      def show
        respond_with @user
      end

      def create
        @user = User.new(user_params)
        respond_to do |format|
          if @user.save
            format.html { redirect_to @user, notice: 'created successfully' }
            format.json { render json: @user, status: :created }
          else
            # format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to @user, notice: 'update successfully' }
            format.json { render json: @user, status: :ok }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end


      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:username, :password)
      end

      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          if User.exists?(token: token)
            @curr_user = User.find_by(token: token)
            true
          else
            false
          end
        end
      end

      def check_valid
        render plain: "{\"error\":\"Unauthorized\"}", status: 401, content_type: 'application/json' unless @user==@curr_user
      end
    end
  end
end
