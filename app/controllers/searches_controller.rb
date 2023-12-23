# app/controllers/searches_controller.rb

class SearchesController < ApplicationController
  protect_from_forgery with: :null_session, only: :save_query # Zaštita od CSRF tokena

  def index
    respond_to do |format|
      format.html # Omogućava običan HTML prikaz
      format.js # Omogućava JavaScript format (AJAX)
    end
  end

  def save_query
    query = params[:query]

    if query.present? && query.end_with?('?')
      current_user.searches.create(query:)
      redirect_to searches_index_path, notice: 'Query saved successfully.'
    else
      redirect_to searches_index_path, alert: 'Query must not be blank and should end with a question mark (?).'
    end
  end
end
