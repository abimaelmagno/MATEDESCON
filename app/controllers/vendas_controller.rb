class VendasController < ApplicationController

  def update
    @firma = Firma.find(params[:firma_id])
    valor_vendas = @firma.compras + 20
    quantidade_vendas = rand(10..@firma.product)
    @firma.product -= quantidade_vendas
    @firma.capital += quantidade_vendas * valor_vendas
    value = quantidade_vendas * valor_vendas
    @firma.periodo += 1
    if @firma.save
      Lancamento.create(tipo: "Venda", quantity: quantidade_vendas.to_i, initcap: @firma.capital - value, saldo: @firma.capital, estoque: @firma.product, value: value,  firma: @firma, date: @firma.periodo)
      redirect_to firma_lancamentos_path(@firma)
    else
      redirect_to firma_path(@firma), notice: "Bug no sistema"
    end
  end

  private

  def fornecedor_params
    params.require(:fornecedor).permit(:firma_id)
  end

end
