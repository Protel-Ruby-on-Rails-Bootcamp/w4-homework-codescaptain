class WelcomeController < ApplicationController
  def index
    redirect_to feed_profile_index_path if current_user
  end
end
