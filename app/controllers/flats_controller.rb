class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @flats = Flat.all
    respond_with(@flats)
  end

  def show
    respond_with(@flat)
  end

  def new
    @flat = Flat.new
    respond_with(@flat)
  end

  def edit
  end

  def create
    @flat = current_user.flats.new(flat_params)
    @flat.save
    respond_with(@flat)
  end

  def update
    @flat.update(flat_params)
    respond_with(@flat)
  end

  def destroy
    @flat.destroy
    respond_with(@flat)
  end

  private
    def set_flat
      @flat = Flat.find(params[:id])
    end

    def flat_params
      params.require(:flat).permit(:title, :address, :description, :picture)
    end
end
