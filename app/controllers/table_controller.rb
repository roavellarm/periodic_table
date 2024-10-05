class TableController < ApplicationController
  def index
    @elements = formated_elements_data
  end

  private

  def elements
    Element.joins(:order).includes(:shells, :ionization_energies).order('orders.id')
  end

  def formated_elements_data
    elements.each_with_object({ "order" => [] }) do |element, hash|
      element_key = element.name.parameterize(separator: '_')
      hash["order"] << element_key
      hash[element_key] = element.as_json
    end
  end
end
