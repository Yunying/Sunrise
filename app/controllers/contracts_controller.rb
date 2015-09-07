class ContractsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
  require "prawn"

  def download_file
    @file = Contract.find(params[:id]).file
    send_file(
      @file.path,
      filename: "File.pdf",
      type: "application/pdf"
    )
  end

  # GET /contracts
  # GET /contracts.json
  def index
    @contracts = Contract.search(params[:search]).search_month(params[:start_month], params[:end_month])
    @clients = Client.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Hello World"
        send_data pdf.render, :filename => 'products.pdf', :type => 'application/pdf', :disposition => 'inline'
      end
      format.csv {render text: @contracts.to_csv}
      format.xls #do { send_data @contracts.to_csv(col_sep: "\t") }
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    @contract = Contract.all.find(params[:id])
    @orders = @contract.orders
    @contract_amount = 0
    @orders.each do |order|
      @contract_amount += order.unit_price*order.unit_count
    end
    @vendors = Vendor.all
    @client = Client.all.find(@contract.client_id)
    @invoice = @contract.invoices
    @note = Note.new
    @notes = @contract.notes
    @file = @contract.file
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
    @clients = Client.all.order("name ASC")
  end

  # GET /contracts/1/edit
  def edit
    @clients = Client.all
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: 'Contract was successfully created.' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    @contract = Contract.find(params[:id])

    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to @contract, notice: 'Contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:title, :client_id, :sign_date, :description, :cost, :amount, :file)
    end

    def sort_column
      Contract.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
