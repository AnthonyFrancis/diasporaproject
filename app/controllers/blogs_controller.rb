class BlogsController < InheritedResources::Base

	def show
    	@blog = Blog.friendly.find(params[:id])
  	end

  private

    def blog_params
      params.require(:blog).permit(:title, :body)
    end

end
