class RoulettesController < ApplicationController
  before_action :set_roulette, only: [:show, :edit, :update, :destroy]

  # GET /roulettes
  # GET /roulettes.json
  def index
    @roulettes = Roulette.all
  end

  # GET /roulettes/1
  # GET /roulettes/1.json
  def show
    # if Roulette.exists?(game_id: @game.id)
    #   @roulettes = Roulette.where(game_id: @game.id)
    # else
    #   @roulettes = Roulette.new(game_id: @game.id, weather_avg: 10, number_rounds: 1, winning_number: roulette.spin)
    #   @roulettes.save
    # end
    @roulettes = Roulette.all
    @game = Game.first!
    #@player_bet = roulette.player_bet
  end

  # GET /roulettes/new
  def new
    @roulette = Roulette.new
  end

  # GET /roulettes/1/edit
  def edit
  end

  # POST /roulettes
  # POST /roulettes.json
  def create
    @roulettes = RouletteGame.new
    @roulette = Roulette.new(roulette_params)

    respond_to do |format|
      if @roulette.save
        format.html { redirect_to @roulette, notice: 'Roulette was successfully created.' }
        format.json { render :show, status: :created, location: @roulette }
      else
        format.html { render :new }
        format.json { render json: @roulette.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roulettes/1
  # PATCH/PUT /roulettes/1.json
  def update
    respond_to do |format|
      if @roulette.update(roulette_params)
        format.html { redirect_to @roulette, notice: 'Roulette was successfully updated.' }
        format.json { render :show, status: :ok, location: @roulette }
      else
        format.html { render :edit }
        format.json { render json: @roulette.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roulettes/1
  # DELETE /roulettes/1.json
  def destroy
    @roulette.destroy
    respond_to do |format|
      format.html { redirect_to roulettes_url, notice: 'Roulette was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roulette
      @roulette = Roulette.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roulette_params
      params.permit(:game_id, :weather_avg, :number_rounds, :winning_number)
    end
end
