class AnalysesController < ApplicationController
  def index
    @my_searches = current_user.searches.order('created_at DESC')

    @all_searches = Search.includes(:user).order('users.email, searches.created_at DESC')

    # Dodaj vremenski filter za "My Searches"
    if params[:my_start_date].present? && params[:my_end_date].present?
      my_start_date = Date.parse(params[:my_start_date])
      my_end_date = Date.parse(params[:my_end_date])
      @my_searches = @my_searches.where(created_at: my_start_date.beginning_of_day..my_end_date.end_of_day)
    end

    # Dodaj vremenski filter za "All Searches"
    if params[:all_start_date].present? && params[:all_end_date].present?
      all_start_date = Date.parse(params[:all_start_date])
      all_end_date = Date.parse(params[:all_end_date])
      @all_searches = @all_searches.where(created_at: all_start_date.beginning_of_day..all_end_date.end_of_day)
    end

    respond_to do |format|
      format.html # Omogućava običan HTML prikaz
      format.csv { send_data @my_searches.to_csv, filename: "my_searches-#{Date.today}.csv" } # Dodaj ovo
    end
  end
end
