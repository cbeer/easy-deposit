class DepositsController < ApplicationController
  load_and_authorize_resource
  before_action :set_deposit_user, only: [:create]

  # GET /deposits
  # GET /deposits.json
  def index
  end

  # GET /deposits/1
  # GET /deposits/1.json
  def show
  end

  # GET /deposits/new
  def new
  end

  # GET /deposits/1/edit
  def edit
  end

  # POST /deposits
  # POST /deposits.json
  def create
    respond_to do |format|
      if @deposit.save
        format.html { redirect_to @deposit, notice: 'Deposit was successfully created.' }
        format.json { render :show, status: :created, location: @deposit }
      else
        format.html { render :new }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deposits/1
  # PATCH/PUT /deposits/1.json
  def update
    respond_to do |format|
      if @deposit.update(deposit_params)
        format.html { redirect_to @deposit, notice: 'Deposit was successfully updated.' }
        format.json { render :show, status: :ok, location: @deposit }
      else
        format.html { render :edit }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deposits/1
  # DELETE /deposits/1.json
  def destroy
    @deposit.destroy
    respond_to do |format|
      format.html { redirect_to deposits_url, notice: 'Deposit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def deposit_params
    params.require(:deposit).permit(:title, :author, :date, :description, :resource_type, :citation, parts_files: [])
  end

  def set_deposit_user
    @deposit.user = current_user
  end
end
