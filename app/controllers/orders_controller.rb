class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.search(params[:search]).search_month(params[:start_month], params[:end_month]).order(sort_column + " " + sort_direction)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @vendors = Vendor.all
  end

  # GET /orders/new
  def new
    @order = Order.new
    @vendors = Vendor.all.order("name ASC")
    @contract = params[:contract_id]
    @contracts = Contract.all.order("title ASC")
  end

  # GET /orders/1/edit
  def edit
    @vendors = Vendor.all.order("name ASC")
    @contract = params[:contract_id]
    @contracts = Contract.all.order("title ASC")
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        if !@order.contract_id.nil?
          format.html { redirect_to Contract.all.find(@order.contract_id), notice: 'Order was successfully created.' }
        else
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
        end
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
      params.require(:order).permit(:order_id, :contract_id, :vendor_id, :unit_price, :unit_count, :amount, :content)
    end

    def sort_column
      Order.column_names.include?(params[:sort]) ? params[:sort] : "order_id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
