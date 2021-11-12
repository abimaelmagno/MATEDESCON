class VendasController < ApplicationController

  # def update
  #   @firma = Firma.find(params[:firma_id])
  #   valor_vendas= @firma.compras + 20
  #   quantidade_vendas = rand(10..@firma.product)
  #   @firma.product -= quantidade_vendas
  #   @firma.capital += quantidade_vendas * valor_vendas
  #   value = quantidade_vendas * valor_vendas
  #   @firma.periodo += 1
  #   if @firma.save
  #     Lancamento.create(tipo: "Venda", quantity: quantidade_vendas.to_i, initcap: @firma.capital - value, saldo: @firma.capital, estoque: @firma.product, value: value,  firma: @firma, date: @firma.periodo)
  #     redirect_to firma_lancamentos_path(@firma)
  #   else
  #     redirect_to firma_path(@firma), notice: "Bug no sistema"
  #   end 
  # end

  def update
    @firma = Firma.find(params[:firma_id])
    if @firma.periodo == 0
      valor_vendas= @firma.compras + 20
      min_vendas = @firma.product / 10
      quantidade_vendas = rand(min_vendas..@firma.product)
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

    elsif @firma.periodo == 11 || @firma.periodo == 23
      valor_vendas= @firma.compras + 20  
      quantidade_vendas = @firma.product - 1
      @firma.product -= quantidade_vendas
      @firma.capital += quantidade_vendas * valor_vendas
      value = quantidade_vendas * valor_vendas
      @firma.periodo += 1
      if @firma.save
        Lancamento.create(tipo: "Venda", quantity: quantidade_vendas.to_i, initcap: @firma.capital - value, saldo: @firma.capital, estoque: @firma.product, value: value,  firma: @firma, date: @firma.periodo)
        redirect_to firma_lancamentos_path(@firma), notice: "Feliz ano novo!!"
      else
        redirect_to firma_path(@firma), notice: "Bug no sistema"
      end 
    elsif @firma.periodo == 35  
      valor_vendas= @firma.compras + 30
      min_vendas = @firma.product
      quantidade_vendas = @firma.product
      @firma.product -= quantidade_vendas
      @firma.capital += quantidade_vendas * valor_vendas
      value = quantidade_vendas * valor_vendas
      @firma.periodo += 1
      if @firma.save
        Lancamento.create(tipo: "Venda", quantity: quantidade_vendas.to_i, initcap: @firma.capital - value, saldo: @firma.capital, estoque: @firma.product, value: value,  firma: @firma, date: @firma.periodo)
        redirect_to firma_lancamentos_path(@firma), notice: "Fim do Jogo"
      else
        redirect_to firma_path(@firma), notice: "Bug no sistema"
      end 
    elsif @firma.periodo.odd?
      valor_vendas= @firma.compras + 5
      quantidade_vendas = rand(10..@firma.product)
      min_vendas = @firma.product / 20
      quantidade_vendas = rand(min_vendas..@firma.product)
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

    elsif @firma.periodo.even?
      valor_vendas= @firma.compras + 10
      min_vendas = @firma.product / 10
      quantidade_vendas = rand(min_vendas..@firma.product)
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
  end

  private

  def fornecedor_params
    params.require(:fornecedor).permit(:firma_id)
  end

end
