class BlogsController < InheritedResources::Base

	def index
    	@blogs = Blog.where(state: 'Published').order("created_at DESC").page(params[:page])
  	end


	def show
    	@blog = Blog.friendly.find(params[:id])
  	end

  private

    def blog_params
      params.require(:blog).permit(:title, :body, :image, :publisher, :publisher, :published_at, :state)
    end

end
