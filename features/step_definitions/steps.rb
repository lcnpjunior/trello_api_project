
Dado(/^que meu usuário tenha acesso ao Trello$/) do
  @trello_api = TrelloApi.new(APP_KEY, TOKEN)
  @response = @trello_api.get_all_user_info
  expect(@response.code).to eq 200
end

Quando(/^criar um quadro$/) do
  @response = @trello_api.create_board($board_options)
end

Então(/^quadro é criado com sucesso$/) do
  expect(@response.code).to eq 200
  expect(@response['name']).to eq $board_options['name']
  @id_board = @response['id']
end

Quando(/^incluo as listas\/colunas$/) do |table|
  $list_options['idBoard'] =  @id_board
  @board_list = table.raw
  @board_list.reverse.each do |item|
    $list_options['name'] = item.first
    @response = @trello_api.create_list($list_options)
    expect(@response.code).to eq 200
  end
end

Então(/^verifico que as listas foram incluídas com sucesso em meu quadro$/) do
  @response = @trello_api.get_lists_board(@id_board)
  expect(@response.code).to eq 200
  for i in 0..@board_list.count-1
    expect(@board_list[i].first).to eq @response[i]['name']
  end
end

Dado(/^e obtenha o id do quadro através do nome "([^"]*)"$/) do |nome_quadro|
  @lista_ids = []
  @nome_quadro = nome_quadro
  @response.each do |quadro|
    @lista_ids << quadro['id'] if quadro['name'] == @nome_quadro
  end
  puts @lista_ids
end

Quando(/^deletar o quadro pelo id$/) do
  id_usuario = @response.first['memberships'].first['idMember']
  @lista_ids.each do |quadro_id|
    @response = @trello_api.close_board(quadro_id, { 'closed' => 'true' })
    expect(@response.code).to eq 200
    @response = @trello_api.delete_board(quadro_id)
    expect(@response.code).to eq 200
  end
end

Então(/^quadro é deletado com sucesso$/) do
  @response = @trello_api.get_all_user_info
  expect(@response.code).to eq 200
  @response.each do |quadro|
    expect(quadro['name']).not_to eq @nome_quadro
  end
end
