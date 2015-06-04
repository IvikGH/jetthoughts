class PagesController < ApplicationController
  before_action :set_user, only: [ :user_profile_show,
                                   :user_profile_edit,
                                   :user_profile_update]
  def users_all
    @users = User.all
  end

  def user_profile_show
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def user_profile_edit
  end

  def user_profile_update
    respond_to do |format|
      @user.update(user_params)
      if @user.save
        format.html { redirect_to edit_profile_path, notice: 'Your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
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

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit( :login,
                                  :full_name,
                                  :birthday,
                                  :address,
                                  :city,
                                  :state,
                                  :country,
                                  :zip)
  end

end
