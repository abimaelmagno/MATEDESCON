class FornecedoresController < ApplicationController
  before_action :set_fornecedor, only: [:show, :destroy, :edit]

  def index
    # @fornecedores = Fornecedor.all.sample(3)
    @firma = Firma.find(params[:firma_id])
    if @firma.sector == "Vestuário"
      @fornecedores = Fornecedor.where(name_produto: "roupa").sample(3)
    elsif @firma.sector == "Alimentação"
      @fornecedores = Fornecedor.where(name_produto: "quentinha").sample(3)
    elsif @firma.sector == "brinquedo"
      @fornecedores = Fornecedor.where(name_produto: "brinquedo").sample(3)
    end
  end

  # def new 
  #   @fornecedor = Fornecedor.new
  # end

  # def create
  #   @fornecedor = Fornecedor.new(firma_params)
  #   @fornecedor.firma = @firma
  #   fornecedor.user = current_user
  #   @fornecedor.save
  # end

  def show
  end

  def edit
    @firma = Firma.find(params[:firma_id])
    quantity = fornecedor_params[:estoque]
    @firma.product = quantity
    @firma.save
    @fornecedor.estoque = @fornecedor.estoque.to_i - quantity.to_i
    @fornecedor.save
    redirect_to firma_fornecedores_path(@firma)
  end
  # def show_three
  #   @firma = Firma.find(params[:id])
  #   @fornecedores = Fornecedor.all.sample(3)
  # end
  private
  
  def fornecedor_params
    params.require(:fornecedor).permit(:estoque, :firma_id)
  end

  def set_firma
    @firma = Firma.find(params[:firma_id])
  end

  def set_fornecedor
    @fornecedor = Fornecedor.find(params[:id])
  end
end
