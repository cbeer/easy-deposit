class PartsController < ApplicationController
  load_and_authorize_resource :deposit
  load_and_authorize_resource through: :deposit

  # GET /parts
  # GET /parts.json
  def index
  end

  # GET /parts/1
  # GET /parts/1.json
  def show
  end

  # GET /parts/new
  def new
  end

  # GET /parts/1/edit
  def edit
  end

  # POST /parts
  # POST /parts.json
  def create
    respond_to do |format|
      if @part.save
        format.html { redirect_to @part, notice: 'Part was successfully created.' }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render :new }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parts/1
  # PATCH/PUT /parts/1.json
  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to @part, notice: 'Part was successfully updated.' }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1
  # DELETE /parts/1.json
  def destroy
    @part.destroy
    respond_to do |format|
      format.html { redirect_to parts_url, notice: 'Part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def part_params
    params.require(:part).permit(:file)
  end
end
