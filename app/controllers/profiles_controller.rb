class ProfilesController < InheritedResources::Base

  private

    def profile_params
      params.require(:profile).permit(:name, :location, :mininvest, :maxinvest, :angelurl, :photo)
    end

end
