class ApplicationController < ActionController::Base
  # Ostatak koda

  protected

  def after_sign_in_path_for(_resource)
    # Ovde postavite putanju na koju želite preusmeriti korisnika nakon prijave
    searches_index_path
  end
end
