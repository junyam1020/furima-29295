class DealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @deal = DealDestination.new
    @deals = Deal.all
    @deals.each do |deal|
      if @item.user_id == current_user.id
        redirect_to root_path
        break
      elsif @item.id == deal.item_id
        redirect_to root_path
        break
      end
    end
  end

  def create
    # FormオブジェクトであるDealDestinationにdeal_paramsを指定する
    @deal = DealDestination.new(deal_params)
    # 入力情報に問題ないか確認
    if @deal.valid?
      # 購入処理に必要なトークンと価格情報を渡す
      pay_item
      # DealDestination内のsaveメソッドを実施
      @deal.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def deal_params
    # 今回フォームの入力値を対象のカラムに保持するためparamsで扱う許可をする
    params.permit(:token, :postal_code, :prefecture, :city, :house_number, :phone_number, :building, :item_id)
          .merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: deal_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類(日本円)
    )
  end
end
