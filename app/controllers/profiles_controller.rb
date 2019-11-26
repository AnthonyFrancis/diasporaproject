class ProfilesController < InheritedResources::Base

def index
  	@syndicates = Syndicate.all
  	@users = User.all
    @profiles = Profile.all
end


  private

    def profile_params
      params.require(:profile).permit(:name, :location, :mininvest, :maxinvest, :angelurl, :photo, :website_url, :angellist_url, :linkedin_url, :twitter_url, :investor_type)
    end

end
