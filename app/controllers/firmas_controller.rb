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
    @firma.compras = @fornecedor.preco.to_i
    value = quantity.to_i * @fornecedor.preco.to_i 
    if @firma.save
      Lancamento.create(tipo: "Compra", quantity: quantity.to_i, initcap: @firma.capital + value, saldo: @firma.capital, estoque: @firma.product, value: quantity.to_i * @fornecedor.preco.to_i ,  firma: @firma, date: @firma.periodo)
      @fornecedor.estoque -= quantity.to_i
      @fornecedor.save
      redirect_to firma_path(@firma)
    else
      redirect_to firma_path(@firma), notice: "Você não tem dinheiro para isso! Quer fazer um empréstimo?"
    end 
  end 

  # tentativa de fazer um metodo (rota não leva para o id da firma)

  # def venda
  #   @firma = Firma.find(params[:firma_id])
  #   valor_vendas= @firma.compras + 20
  #   quantidade_vendas = rand(10..@firma.product)
  #   @firma.product -= quantidade_vendas
  #   @firma.capital += quantidade_vendas * valor_vendas
  #   value = quantidade_vendas * valor_vendas
  #   raise
  #   if @firma.save
  #     Lancamento.create(tipo: "Venda", quantity: quantidade_vendas.to_i, initcap: @firma.capital - value, saldo: @firma.capital, estoque: @firma.product, value: value ,  firma: @firma, date: Time.now)
  #     redirect_to firma_lancamento_path(@firma)
  #   else
  #     redirect_to firma_path(@firma), notice: "Bug no sistema"
  #   end 
  # end

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
