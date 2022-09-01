class MinesController < ApplicationController
  before_action :set_mine, only: %i[ show edit update destroy ]

  # GET /mines or /mines.json
  def index
    @mines = Mine.all
  end

  # GET /mines/1 or /mines/1.json
  def show
  end

  # GET /mines/new
  def new
    @mine = Mine.new
  end

  # GET /mines/1/edit
  def edit
  end

  # POST /mines or /mines.json
  def create
    @mine = Mine.new(mine_params)

    respond_to do |format|
      if @mine.save
        format.html { redirect_to mine_url(@mine), notice: "Mine was successfully created." }
        format.json { render :show, status: :created, location: @mine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mines/1 or /mines/1.json
  def update
    respond_to do |format|
      if @mine.update(mine_params)
        format.html { redirect_to mine_url(@mine), notice: "Mine was successfully updated." }
        format.json { render :show, status: :ok, location: @mine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mines/1 or /mines/1.json
  def destroy
    @mine.destroy

    respond_to do |format|
      format.html { redirect_to mines_url, notice: "Mine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mine
      @mine = Mine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mine_params
      params.require(:mine).permit(:Title, :body)
    end
end
