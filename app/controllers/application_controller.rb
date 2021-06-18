class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	after_action :verify_authorized, except: :index, unless: :skip_pundit?

	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


	private
		def user_not_authorized
			flash[:notice] = "Acceso denegado"
			redirect_to  root_path
		end

		def skip_pundit?
			devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
		end
end
