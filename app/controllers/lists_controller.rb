class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @investors = current_user.list.investors.paginate(:page => params[:page], :per_page => 8)

    respond_to do |format|
      format.html
      format.csv { send_data @investors.to_csv, filename: "investors-#{Date.today}.csv" }
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
