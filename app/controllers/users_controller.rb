class UsersController < Devise::RegistrationsController

def new
	super
end

def create
	super
end

def update
	resource_updated = update_resource(resource, account_update_params)
	if resource_updated
		redirect_back(fallback_location: root_path)
	end
end


def update_resource(resource, params)
 	resource.update_without_password(params)
end


def resource_name
	:user
end

def devise_mapping
	@devise_mapping ||= Devise.mappings[:user]
end

def after_update_path_for(resource)
  root_path
end

def index
	if params[:q]
		@users = User.where("name iLike :query or username iLike :query", query: "%#{params[:q]}%")
		@profiles = Profile.where("name iLike :query", query: "%#{params[:q]}%")
		@combo =  @profiles + @users
		unless user_signed_in?
			@users = @users.limit(3)
			@profiles = @profiles.limit(3)
		end
	else
		@users = User.all
		@profiles = Profile.all
		@combo =  @profiles + @users
	end
end

def investors
	@investors = User.where(["investor = ?", true])
end

def show
	@user = User.find_by_username(params[:id])
end

protected

def after_sign_up_path_for(resource)
   after_sign_in_path_for(resource)
end

end