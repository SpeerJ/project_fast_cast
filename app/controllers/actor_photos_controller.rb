class ActorPhotosController < ApplicationController
  before_action :set_actor_photo, only: %i[ show edit update destroy ]

  # GET /actor_photos or /actor_photos.json
  def index
    @actor = Actor.find(params[:actor_id])
    @actor_photos = @actor.photos
  end

  # GET /actor_photos/1 or /actor_photos/1.json
  def show
  end

  # GET /actor_photos/new
  def new
    @actor = Actor.find(params[:actor_id])
  end

  def edit
  end

  # POST /actor_photos or /actor_photos.json
  def create
    @actor = Actor.find(params[:actor_id])

    respond_to do |format|
      if @actor.photos.attach(actor_photo_params)
        format.html { redirect_to actor_actor_photos_path, notice: "Actor photo was successfully created." }
        format.json { render :index, status: :created, location: actor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end

  # DELETE /actor_photos/1 or /actor_photos/1.json
  def destroy
    @actor_photo.destroy!

    respond_to do |format|
      format.html { redirect_to actor_photos_path, status: :see_other, notice: "Actor photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor_photo
      @actor_photo = ActorPhoto.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def actor_photo_params
      params.expect(:photo)
    end
end
