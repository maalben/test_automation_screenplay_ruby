# frozen_string_literal: true

class MontoMasAltoQuestion
  def initialize(page)
    @page = page
  end

  def answered_by
    # Extraemos los montos de la tabla
    montos = @page.transaction_rows.map do |fila|
      monto_texto = fila.find('td.text-right span').text
      monto_texto.gsub(/[^\d\.\-]/, '').to_f
    end

    # Retornamos el monto máximo
    montos.max
  end
end