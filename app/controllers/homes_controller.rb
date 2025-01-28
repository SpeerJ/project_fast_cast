class HomesController < ApplicationController
  before_action :set_home, only: %i[ show edit update destroy ]

  # GET /homes or /homes.json
  def index
    # Todo: only sample active profiles
    @actors = Actor.all.sample(10)
  end
end
