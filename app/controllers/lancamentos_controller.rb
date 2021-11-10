class LancamentosController < ApplicationController

def compra
  @firma.product = @firma.product + @compra.quantity
  @firma.capital = @firma.capital - @compra.valor
end

def venda
  @firma.product = @firma.product - @venda.quantity
  @firma.capital = @firma.capital + @venda.valor
end

end
