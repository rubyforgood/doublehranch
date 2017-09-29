class PositionsHeldsController < ApplicationController
  before_action :set_positions_held, only: [:show, :edit, :update, :destroy]

  # GET /positions_helds
  # GET /positions_helds.json
  def index
    @positions_helds = PositionsHeld.all
  end

  # GET /positions_helds/1
  # GET /positions_helds/1.json
  def show
  end

  # GET /positions_helds/new
  def new
    @positions_held = PositionsHeld.new
  end

  # GET /positions_helds/1/edit
  def edit
  end

  # POST /positions_helds
  # POST /positions_helds.json
  def create
    @positions_held = PositionsHeld.new(positions_held_params)

    respond_to do |format|
      if @positions_held.save
        format.html { redirect_to @positions_held, notice: 'Positions held was successfully created.' }
        format.json { render :show, status: :created, location: @positions_held }
      else
        format.html { render :new }
        format.json { render json: @positions_held.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /positions_helds/1
  # PATCH/PUT /positions_helds/1.json
  def update
    respond_to do |format|
      if @positions_held.update(positions_held_params)
        format.html { redirect_to @positions_held, notice: 'Positions held was successfully updated.' }
        format.json { render :show, status: :ok, location: @positions_held }
      else
        format.html { render :edit }
        format.json { render json: @positions_held.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions_helds/1
  # DELETE /positions_helds/1.json
  def destroy
    @positions_held.destroy
    respond_to do |format|
      format.html { redirect_to positions_helds_url, notice: 'Positions held was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_positions_held
      @positions_held = PositionsHeld.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def positions_held_params
      params.require(:positions_held).permit(:user_id, :position_id, :program_id)
    end
end
