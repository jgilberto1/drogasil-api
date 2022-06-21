class RequestCarrinho
  def self.item
    cart_id = ApiCommons.cart_id
    token_cart = ApiCommons.token_cart
    endpoint = OpenStruct.new
    endpoint['cartItem'] = OpenStruct.new
    endpoint['cartItem']['sku'] = API_DATA_SKUS['skus']['luftal']
    endpoint['cartItem']['qty'] = 1
    endpoint['cartItem']['quote_id'] = cart_id.to_s
    endpoint['cartItem'] = endpoint['cartItem'].marshal_dump
    endpoint['token_cart'] = token_cart
    endpoint.marshal_dump
  end
end
