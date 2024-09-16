# frozen_string_literal: true

Then("Yo deberia ser redirigido a la pagina de la tabla de gastos") do
  expect(current_url).to eq(HOME_HOST)
end

Then("Yo deberia ver exactamente {int} transacciones en la tabla") do |quantity|
  home_page = HomePage.new
  expect(home_page.transaction_rows.count).to eq(quantity)
end

Then("Yo deberia ver el saldo total de {int}") do |balance|
  home_page = HomePage.new
  balance_question = BalanceQuestion.new(home_page)
  expect(balance_question.total_balance).to include(balance.to_s)
end

Then("Yo deberia ver el credito disponible de {string}") do |credit|
  home_page = HomePage.new
  balance_question = BalanceQuestion.new(home_page)
  expect(balance_question.credit_available).to include(credit.to_s)
end

When("Yo deberia validar que todos los valores {string} deben ser de color {string}") do |value_type, color|
  home_page = HomePage.new
  home_page.transaction_rows.each do |row|
    values = row.all(".#{value_type}-value")
    values.each do |value|
      expect(@utilities.rgb_to_hex(value.native.style('color'))).to eq(color) # Valida el color
    end
  end
end

Then("Yo deberia ver que el monto mas alto es {string}") do |montoAlto|
  home_page = HomePage.new
  monto_mas_alto_question = MontoMasAltoQuestion.new(home_page)
  monto_mayor = monto_mas_alto_question.answered_by
  monto_formateado = @utilities.formatear_monto(monto_mayor)
  expect(montoAlto).to include(monto_formateado)
end

Then("Yo deberia ver que el monto mas bajo es {string}") do |montoBajo|
  home_page = HomePage.new
  monto_mas_bajo_question = MontoMasBajoQuestion.new(home_page)
  monto_menor = monto_mas_bajo_question.answered_by
  monto_formateado = @utilities.formatear_monto_bajo(monto_menor)
  expect(montoBajo).to include(monto_formateado)
end