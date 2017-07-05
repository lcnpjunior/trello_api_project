class TrelloApi
  include HTTParty

  base_uri 'https://api.trello.com/1'

  def initialize(app_key, token)
    @autorization = {'key' => app_key, 'token' => token}
  end

  def get_all_user_info
    self.class.get('/member/me/boards', :query => @autorization)
  end

  def get_board(id_board)
    self.class.get("/boards/#{id_board}", :query => @autorization)
  end

  def create_board(board_options)
    board_options.merge!(@autorization)
    self.class.post("/boards", :query => board_options)
  end

  def get_lists_board(id_board)
    self.class.get("/boards/#{id_board}/lists?", :query => @autorization)
  end

  def create_card(card_options)
    self.class.post("/cards", :query => @autorization)
  end

  def create_list(list_options)
    list_options.merge!(@autorization)
    self.class.post('/lists', :query => list_options)
  end

  def close_board(id_board, close_board_options)
    close_board_options.merge!(@autorization)
    self.class.put("/boards/#{id_board}", :query => close_board_options)
  end

  def delete_board(id_board)
    self.class.delete("/boards/#{id_board}", :query => @autorization)
  end

end
