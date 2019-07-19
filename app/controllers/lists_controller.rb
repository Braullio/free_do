class ListsController < ApplicationController
  before_action :set_list, only: %i[update destroy]
  before_action :list_params, only: %i[create update]

  def create
    @list = List.new(@list_send)
    if @list.save
      flash[:success] = (t 'messages.success.create', :value => (t 'controller.list'))
      redirect_to_back
    else
      flash[:danger] = (t 'messages.error.create', :value => (t 'controller.list'))
      redirect_to_back
    end
  end

  def update
    if @list.update(@list_send)
      flash[:success] = (t 'messages.success.update', :value => (t 'controller.list'))
      redirect_to_back
    else
      flash[:danger] = (t 'messages.error.update', :value => (t 'controller.list'))
      redirect_to_back
    end
  end

  def destroy
    if @list.destroy
      flash[:success] = (t 'messages.success.remove', :value => (t 'controller.list'))
      redirect_to_back
    else
      flash[:danger] = (t 'messages.error.remove', :value => (t 'controller.list'))
      redirect_to_back
    end
  end

  private
  def set_list
    params[:list_id].present? ? (@list = List.find(params[:list_id])) : (@list = List.find(params[:list_id_del]))
  end

  def all_borads
    @lists = List.all
  end

  def list_params
    @list_send = params.permit(:name, :board_id)
  end
end
