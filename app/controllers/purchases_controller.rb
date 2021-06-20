class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_set, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_shipping_address_params)
    if @purchase_shipping_address.valid?
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_shipping_address_params
    price = Item.find_by(id: params[:item_id]).price
    params.require(:purchase_shipping_address).permit(:postcode, :prefecture, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: price
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: purchase_shipping_address_params[:price],
      card: purchase_shipping_address_params[:token],
      currency: 'jpy'
    )
  end

  def item_set
    @item = Item.find_by(id: params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user || @item.purchase.present?
  end
end
