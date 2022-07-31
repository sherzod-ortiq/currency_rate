class UpdateCurrencyRatesJob < ApplicationJob
  queue_as :default

  def perform()
  	rate = Rails.cache.read("rate")
  	if rate != nil && DateTime.now < rate.until_time
  		fixed_rate = rate.fixed_rate
 			ActionCable.server.broadcast("rates_channel", {rub: fixed_rate})
 		else

			begin
				response = HTTParty.get('https://api.apilayer.com/exchangerates_data/latest?symbols=RUB&base=USD', headers: { 'apikey' => Rails.application.credentials[Rails.env.to_sym][:apilayer][:api_key] })
			rescue => e
			  logger.error "..."
			ensure
				response_hash = JSON.parse(response.body)
				response_hash["rates"]["RUB"]
	 			ActionCable.server.broadcast("rates_channel", {rub: response_hash["rates"]["RUB"]})
			end

 		end

  end

end
