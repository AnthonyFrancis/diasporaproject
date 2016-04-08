class SyndicatesController < ApplicationController
  before_action :set_syndicate, only: [:show, :edit, :update, :destroy]


  def index
    @syndicates = Syndicate.all
  end

  def show
  end

  def new
    @syndicate = Syndicate.new
  end

  def edit
  end

  def create
    @syndicate = Syndicate.new(syndicate_params)
    if @syndicate.save
      redirect_to @syndicate, notice: 'Syndicate was successfully created.'
    else
      render :new
    end
  end

  def update
    if @syndicate.update(syndicate_params)
      redirect_to @syndicate, notice: 'Syndicate was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @syndicate.destroy
    redirect_to syndicates_url, notice: 'Syndicate was successfully destroyed.'
  end

  private
    def set_syndicate
      @syndicate = Syndicate.find(params[:id])
    end

    def syndicate_params
      params.require(:syndicate).permit(:description)
    end
end
