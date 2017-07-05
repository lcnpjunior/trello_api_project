Before('@criar_quadro') do
  begin
    $board_options = YAML.load_file('./fixtures/board_options.yml')
    $list_options = YAML.load_file('./fixtures/list_options.yml')
  rescue Exception => ex
    raise "Erro ao ler arquivos de fixtures. Msg: #{ex}"
  end
end
