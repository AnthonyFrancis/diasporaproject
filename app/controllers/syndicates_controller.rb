class SyndicatesController < ApplicationController
  before_action :set_syndicate, only: [:show, :edit, :update, :destroy]


  def index
    @syndicates = Syndicate.all
  end

  def show
  end

  def new
    @syndicate = current_user.syndicates.build
  end

  def edit
  end

  def create
    @syndicate = current_user.syndicates.build(syndicate_params)
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

    def correct_user
      @pin = current_user.syndicates.find_by(id: params[:id])
      redirect_to syndicates_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    def syndicate_params
      params.require(:syndicate).permit(:description)
    end
end
