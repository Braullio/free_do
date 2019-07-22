class CardsController < ApplicationController
  before_action :set_card, only: %i[update destroy]
  before_action :card_params, only: %i[create update]

  def create
    @card = Card.new(@card_send)
    if @card.save
      flash[:success] = (t 'messages.success.create', :value => (t 'controller.card'))
      redirect_to_back
    else
      flash[:danger] = (t 'messages.error.create', :value => (t 'controller.card'))
      redirect_to_back
    end
  end

  def update
    if @card.update(@card_send)
      flash[:success] = (t 'messages.success.update', :value => (t 'controller.card'))
      redirect_to_back
    else
      flash[:danger] = (t 'messages.error.update', :value => (t 'controller.card'))
      redirect_to_back
    end
  end

  def destroy
    if @card.destroy
      flash[:success] = (t 'messages.success.remove', :value => (t 'controller.card'))
      redirect_to_back
    else
      flash[:danger] = (t 'messages.error.remove', :value => (t 'controller.card'))
      redirect_to_back
    end
  end

  private
  def set_card
    params[:card_id].present? ? (@card = Card.find(params[:card_id])) : (@card = Card.find(params[:card_id_del]))
  end

  def all_borads
    @cards = Card.all
  end

  def card_params
    @card_send = params.permit(:title,:description,:list_id)
  end
end
