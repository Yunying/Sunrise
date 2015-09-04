class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @contracts = Contract.all
    @contract = params[:contract_id]
    @client = params[:client_id]
    @vendor = params[:vendor_id]
    @orders = Order.all
    @order = params[:order_id]
    @status = params[:status]
    if !@contract.nil?
      @amount = @contracts.find(@contract).amount
    elsif !@order.nil?
      @amount = @orders.find(@order).unit_price*@orders.find(@order).unit_count
    end
  end

  # GET /invoices/1/edit
  def edit
    @contracts = Contract.all
    @contract = params[:contract_id]
    @client = params[:client_id]
    @vendor = params[:vendor_id]
    @order = params[:order_id]
    @invoice.contract_id = @contract
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:client_id, :vendor_id, :contract_id,:invoice_number, 
        :invoice_date, :total_number, :type, :status,  :order_id)
    end
end
