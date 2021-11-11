class LancamentosController < ApplicationController
  def index
    @firma = Firma.find(params[:firma_id])
    @lancamentos = Lancamento.where(firma: @firma.id)
    @user = User.find(current_user.id)
  end

def compra
  @firma.product = @firma.product + @compra.quantity
  @firma.capital = @firma.capital - @compra.valor
end

def venda
  @firma.product = @firma.product - @venda.quantity
  @firma.capital = @firma.capital + @venda.valor
end

end
