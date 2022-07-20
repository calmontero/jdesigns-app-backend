class UsersController < ApplicationController
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
      end
    
      def show
        render json: @current_user
        #user = User.find_by(id: params[:id])
        #render json: user, include: :profiles
      end
    
      def index
        users = User.all
        render json: users, except: [:created_at, :updated_at]
      end
  
      private
    
      def user_params
        params.permit(:username, :password, :password_confirmation, :email)
      end
end
