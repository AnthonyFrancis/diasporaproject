class UsersController < Devise::RegistrationsController

def new
	super
end

def create
build_resource(sign_up_params)

	resource.save
	yield resource if block_given?
	if resource.persisted?
	  if resource.active_for_authentication?
	    set_flash_message! :notice, :signed_up
	    sign_up(resource_name, resource)
	    respond_with resource, location: after_sign_up_path_for(resource)
	  else
	    set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
	    expire_data_after_sign_in!
	    respond_with resource, location: after_inactive_sign_up_path_for(resource)
	  end
	else
	  set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
	  clean_up_passwords resource
	  set_minimum_password_length
	  redirect_back(fallback_location: root_path)
	end
end

def update
	resource_updated = update_resource(resource, account_update_params)
	if resource_updated
		redirect_back(fallback_location: root_path)
	end
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
	@users = User.all
	if current_user_subscribed?
		@profiles = Profile.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
	else
		@profiles = Profile.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
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

def update_resource(resource, params)
 	resource.update_without_password(params)
end

end