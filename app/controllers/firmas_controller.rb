class FirmasController < ApplicationController
  before_action :set_firma, only: [:show, :destroy, :update]

  def index
    @firmas = Firma.all
  end


  def new
    @firma = Firma.new
  end

  def create
    @firma = Firma.new(firma_params)

    if @firma.save
      redirect_to firmas_path
    else
      render :new
    end
  end

  def show
  end

  def update
    firma.product = firma.product + lancamento.quantity
    @firma.update

  end 

  private
  

  def firma_params
    params.require(:firma).permit(:name, :sector, :capital, :product)
  end

  def set_firma
    @firma = Firma.find(params[:id])
  end
end
