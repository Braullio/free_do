module BoardHelper
  def check_action_board
    @board.present? ? ( @action = "update" ; @method = "patch" ; @title = @board.title ; @description = @board.description)
                    : (@action = "create" ; @method = "post" ; @title = nil ; @description = nil)
  end
end
