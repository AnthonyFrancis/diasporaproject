class ProfilesController < InheritedResources::Base

def index
  	@syndicates = Syndicate.all
  	@users = User.all
    @profiles = Profile.all
end

def new
  @profile = Profile.new
end

def create
     Profile.import(params[:profile][:file])
     flash[:notice] = "Profile uploaded successfully"
     redirect_to profiles_path#=> or where you want
end


  private

    def profile_params
      params.require(:profile).permit(:name, :location, :mininvest, :maxinvest, :angelurl, :photo, :website_url, :angellist_url, :linkedin_url, :twitter_url, :investor_type)
    end

end
