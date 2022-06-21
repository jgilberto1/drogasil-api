module ApiCommons
  def format_json(json)
    JSON.parse(json)
  rescue JSON::ParserError
    JSON.parse(json.to_json)
  end

  def time_now
    Time.now.strftime('%d/%m/%Y %H:%M:%S.%L - GMT %z')
  end

  def token_login
    response = HTTParty.post("#{URL[AMBIENTE]}#{ENDPOINT['token_login']}",
                             headers: { 'Content-Type' => 'application/json' },
                             body: { 'username' => API_DATA_USERS['user_valido']['username'],
                                     'password' => API_DATA_USERS['user_valido']['password'] }.to_json)
  end

  def cart_id
    response = HTTParty.post("#{URL[AMBIENTE]}#{ENDPOINT['cart']}",
                             headers: { 'Content-Type' => 'application/json',
                                        'Authorization' => 'Bearer ' + token_login })
  end

  def token_cart
    response = HTTParty.get('https://api-gateway-qa.drogasil.com.br/discount/v1/token/generate').to_s
  end
end
