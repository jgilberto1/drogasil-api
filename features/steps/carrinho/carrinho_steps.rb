Dado('ter uma massa configurada do endpoint adicionar-item.post') do
  @carrinho_post = RequestCarrinho.item
end

Quando('chamar o endpoint adicionar-item.post') do
  @carrinho_post = carrinho.addItem(@carrinho_post)
end

Então('validar o retorno do endpoint adicionar-item.post') do
  endpoint = @carrinho_post
  expect(endpoint.response.code.to_i).to eql 200
  expect(endpoint.response.message).to eql 'OK'
end

Quando('chamar o endpoint consultar-item.get') do
  @consulta_item = carrinho.consultaItems(@consulta_item)
end

Então('validar o retorno do endpoint consultar-item.get') do
  endpoint = @consulta_item
  expect(endpoint.response.code.to_i).to eql 200
  expect(endpoint.response.message).to eql 'OK'
end

Dado('ter uma massa configurada do endpoint atualizar-item.put') do
  @carrinho_put = RequestCarrinho.item
end

Quando('chamar o endpoint atualizar-item.put') do
  @carrinho_put = carrinho.atualizaItem(@carrinho_put)
end

Então('validar o retorno do endpoint atualizar-item.put') do
  endpoint = @carrinho_put
  expect(endpoint.response.code.to_i).to eql 200
  expect(endpoint.response.message).to eql 'OK'
end

Dado('ter uma massa configurada do endpoint deletar-item.del') do
  step 'ter uma massa configurada do endpoint adicionar-item.post'
  step 'chamar o endpoint adicionar-item.post'
  step 'chamar o endpoint consultar-item.get'
  @consultaItems = carrinho.consultaItems(@consultaItems).to_s
end

Quando('chamar o endpoint deletar-item.del') do
  @response_data = JSON.parse(@consultaItems).with_indifferent_access
  @response_data['items'].each do |item|
    @deleta_item = carrinho.deletaItems(item['item_id'])
  end
end

Então('validar o retorno do endpoint deletar-item.del') do
  endpoint = @deleta_item
  expect(endpoint.response.code.to_i).to eql 200
  expect(endpoint.response.message).to eql 'OK'
end
