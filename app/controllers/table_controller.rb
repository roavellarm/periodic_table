class TableController < ApplicationController
  def index
    @elements = Element.joins(:order).includes(:shells, :ionization_energies).order('orders.id')
  end

  def show
    result = Element.find_by_id(params[:id])

    unless result
      flash[:alert] = 'Elemento não encontrado.'
      return redirect_to table_index_path
    end

    @element = HashWithIndifferentAccess.new(result.as_json)
    render :show
  end
end
