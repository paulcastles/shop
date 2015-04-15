class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  
  respond_to :html

  def index
    @carts = Cart.all
    respond_with(@carts)
  end

  def show
    respond_with(@cart)
  end

  def new
    @cart = Cart.new
    respond_with(@cart)
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.save
    respond_with(@cart)
  end

  def update
    @cart.update(cart_params)
    respond_with(@cart)
  end

  def destroy
    @cart.destroy if @cart_id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html {redirect_to items_url, notice: 'Your cart is currently empty'}
      format.json { head :no_content }
    end
  end

  private
  
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params[:cart]
    end
  
    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to items_url, notice: 'Invalid cart'
    end
end
