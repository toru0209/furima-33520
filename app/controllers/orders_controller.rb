class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @pay_form = PayForm.new
  end

  def create
    @pay_form = PayForm.new(order_params)
    if @pay_form.valid?
      pay_item
      @pay_form.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:pay_form).permit(:postal_code, :prefecture_id, :city, :number, :building, :phone).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id || @item.order != nil
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
