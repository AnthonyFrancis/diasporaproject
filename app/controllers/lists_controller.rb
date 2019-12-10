class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @investors = current_user.list.investors.paginate(:page => params[:page], :per_page => 8)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
