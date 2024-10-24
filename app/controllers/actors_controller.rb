class ActorsController < ApplicationController
  before_action :set_actor, only: %i[ show edit update destroy ]

  # GET /actors or /actors.json
  def index
    @actors = Actor.all
  end

  # GET /actors/1 or /actors/1.json
  def show
  end

  def destroy

  end


  # GET /actors/1/edit
  def edit
  end

  # PATCH/PUT /actors/1 or /actors/1.json
  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to @actor, notice: "Actor was successfully updated." }
        format.json { render :show, status: :ok, location: @actor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def actor_params
      params.expect(actor: [ :about_me, :name, :city ])
    end
end
