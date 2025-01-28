class CastingsController < ApplicationController
  before_action :set_casting, only: %i[ show edit update destroy ]

  # GET /castings or /castings.json
  def index
    @castings = Casting.all
  end

  # GET /castings/1 or /castings/1.json
  def show
  end

  # GET /castings/new
  def new
    @casting = Casting.new
  end

  # GET /castings/1/edit
  def edit
  end

  # POST /castings or /castings.json
  def create
    @casting = Casting.new(casting_params)

    respond_to do |format|
      if @casting.save
        format.html { redirect_to @casting, notice: "Casting was successfully created." }
        format.json { render :show, status: :created, location: @casting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @casting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /castings/1 or /castings/1.json
  def update
    respond_to do |format|
      if @casting.update(casting_params)
        format.html { redirect_to @casting, notice: "Casting was successfully updated." }
        format.json { render :show, status: :ok, location: @casting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @casting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /castings/1 or /castings/1.json
  def destroy
    @casting.destroy!

    respond_to do |format|
      format.html { redirect_to castings_path, status: :see_other, notice: "Casting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_casting
      @casting = Casting.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def casting_params
      params.expect(casting: [ :name, :description ])
    end
end
