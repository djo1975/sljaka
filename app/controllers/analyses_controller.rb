# app/controllers/analyses_controller.rb
class AnalysesController < ApplicationController
    def index
      # Ovde ćete implementirati logiku za prikaz snimljenih upita
      @searches = current_user.searches
    end
  end
  