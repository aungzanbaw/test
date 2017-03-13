class OrdersController < ApplicationController
  before_action :authenticate
  before_action :set_order, only: [:show, :edit, :update, :destroy, :done]

  def done
    @order.status = false
    render :show, status: "Update", location: @order
  end

  # GET /orders
  # GET /orders.json
  def unsolve
    if session[:staff] == 1
      @orders = Order.where(status: true)
    else
      @department = Staff.find_by(id: session[:staff]).department
      @orders = Order.where(status: true, department: @department)
    end
  end

  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @details = Detail.where(order_id: @order.id)
    # @staff_dep = Staff.find(session[:staff]).department if session[:staff] != 1
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.status = true
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_id, :delivery, :gate, :remark, :payment, :status, :department_id)
    end
end
