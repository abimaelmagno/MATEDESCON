class LancamentosController < ApplicationController
  def index
    @lancamentos = Lancamento.all


  end
end
