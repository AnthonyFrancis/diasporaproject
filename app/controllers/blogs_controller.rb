class BlogsController < InheritedResources::Base

	def index
    	@blogs = Blog.all.order("created_at DESC")
  	end


	def show
    	@blog = Blog.friendly.find(params[:id])
  	end

  private

    def blog_params
      params.require(:blog).permit(:title, :body, :image)
    end

end
