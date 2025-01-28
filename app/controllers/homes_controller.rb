class HomesController < ApplicationController
  allow_unauthenticated_access

  # GET /homes or /homes.json
  def index
    # Todo: only sample active profiles
    @actors = Actor.all.sample(3)
  end
end
