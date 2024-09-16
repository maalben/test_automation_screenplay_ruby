# frozen_string_literal: true

class Utilities
  def rgb_to_hex(rgb_value)
    rgb = rgb_value.scan(/\d+/).map(&:to_i)
    format("#%02x%02x%02x", *rgb)
  end

  def formatear_monto(numero)
    # Usa '%.2f' para asegurarte de que haya dos decimales y 'gsub' para agregar las comas
    formatted = '%.2f' % numero
    formatted.gsub(/(\d)(?=(\d{3})+\.)/, '\1,')
  end

  def formatear_monto_bajo(monto)
    # Formateamos el monto a un formato legible (e.g., "- 320.00")
    if monto < 0
      # Aseguramos que haya un espacio entre el signo negativo y el número
      sprintf('- %.2f', monto.abs)
    else
      sprintf('%.2f', monto)
    end
  end

end