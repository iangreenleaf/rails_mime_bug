class UsersController < ApplicationController
  # GET /users.json
  def index
    respond_to do |format|
      format.json {
        @users = User.all
      }
    end
  end
end
