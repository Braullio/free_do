class BoardsController < ApplicationController
  before_action :set_board, only: %i[update destroy show]
  before_action :all_borads, only: %i[index]

  def index; end

  def show; end

  def create
    params.require(:description)
    @board = Board.new(description: params[:description])
    if @board.save
      flash[:success] = (t 'messages.success.create', :value => (t 'controller.board'))
      root_path
    else
      root_path
    end
  end

  def update
    if @board.update(board_params)
      flash[:success] = (t 'messages.success.update', :value => (t 'controller.board'))
      root_path
    else
      root_path
    end
  end

  def destroy
    @board.destroy
    flash[:success] = (t 'messages.success.remove', :value => (t 'controller.board'))
    root_path
  end

  private
  def set_board
    @board = Board.find(params[:id])
  end

  def all_borads
    @boards = Board.all
  end

  def board_params
    params.require(:board).permit(:description)
  end
end
