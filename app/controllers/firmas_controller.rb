class FirmasController < ApplicationController
  before_action :set_firma, only: [:show, :destroy, :update]
  before_action :set_fornecedor, only: [:update]

  def index
    @firmas = Firma.all
  end


  def new
    @firma = Firma.new
  end

  def create

    @firma = Firma.new(firma_params)
    @firma.user = current_user
    if @firma.save
      redirect_to firmas_path
    else
      render :new
    end
  end

  def show
  end

  def update
    quantity = firma_params[:product]
    @firma.product += quantity.to_i
    @firma.capital -= quantity.to_i * @fornecedor.preco.to_i 
    if @firma.save
      Lancamento.create(tipo: "Compra", quantity: quantity.to_i, value: quantity.to_i * @fornecedor.preco.to_i ,  firma: @firma, date: Time.now)
      @fornecedor.estoque -= quantity.to_i
      @fornecedor.save
      redirect_to firma_path(@firma)
    else
      redirect_to firma_path(@firma), notice: "Erro ao atualizar estoque"
    end 
  end 


  def destroy
    @firma.destroy
    redirect_to firmas_path(current_user)
  end

  private
  
  def set_fornecedor
    @fornecedor = Fornecedor.find(params[:fornecedor_id])
  end

  def firma_params
    params.require(:firma).permit(:name, :sector, :capital, :product, :photo)
  end

  def set_firma
    @firma = Firma.find(params[:id])
  end
end
