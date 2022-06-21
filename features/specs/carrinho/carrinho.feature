#language:pt

@Carrinho
Funcionalidade: Validar os endpoints de carrinho
  Eu como usuário do sistema
  quero que ao consultar as APIs de Carrinho
  sejam retornados os valores corretamente.
  
  @post_adicionar_item @post
  Cenário: Validar a chamada do endpoint adicionar-item.post
    Dado ter uma massa configurada do endpoint adicionar-item.post
    Quando chamar o endpoint adicionar-item.post
    Então validar o retorno do endpoint adicionar-item.post

  @get_consultar_itens @get
  Cenário: Validar a chamada do endpoint consultar-item.get
    Quando chamar o endpoint consultar-item.get
    Então validar o retorno do endpoint consultar-item.get

  @put_atualizar_item @put
  Cenário: Validar a chamada do endpoint atualizar-item.put
    Dado ter uma massa configurada do endpoint atualizar-item.put
    Quando chamar o endpoint atualizar-item.put
    Então validar o retorno do endpoint atualizar-item.put

  @del_item @delete
  Cenário: Validar a chamada do endpoint deletar-item.del
    Dado ter uma massa configurada do endpoint deletar-item.del
    Quando chamar o endpoint deletar-item.del
    Então validar o retorno do endpoint deletar-item.del