class PagesController < ApplicationController
	before_action :authenticate_user!, except: %i[home]
	#before_action :authenticate_user!
  def home
  end
end
