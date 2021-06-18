class PagesController < ApplicationController
	before_action :authenticate_user!, except: %i[home]
	#before_action :authenticate_user!
  def home
  end

  def profile
  end

  def update_profile
    current_user.update(user_params)
    redirect_to profile_pages_path
  end

  private
    def user_params
      params.require(:user).permit(:full_name, :type_identification, :identification, :birth_date, :profile, :email)
    end
end
