# spec/controllers/searches_controller_spec.rb
require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST #save_query' do
    context 'with a valid query' do
      it 'creates a new search record' do
        # Ručno kreiranje korisnika
        user = User.create(email: 'test@example.com', password: 'password')
        sign_in user

        post :save_query, params: { query: 'Is this a valid query?' }

        expect(user.searches.count).to eq(1)
        expect(user.searches.first.query).to eq('Is this a valid query?')
      end

      it 'redirects to the index page with a success notice' do
        # Ručno kreiranje korisnika
        user = User.create(email: 'test@example.com', password: 'password')
        sign_in user

        post :save_query, params: { query: 'Is this a valid query?' }

        expect(response).to redirect_to(searches_index_path)
        expect(flash[:notice]).to eq('Query saved successfully.')
      end
    end

    context 'with an invalid query' do
      it 'does not create a new search record' do
        # Ručno kreiranje korisnika
        user = User.create(email: 'test@example.com', password: 'password')
        sign_in user

        post :save_query, params: { query: '' }

        expect(user.searches.count).to eq(0)
      end

      it 'redirects to the index page with an alert' do
        # Ručno kreiranje korisnika
        user = User.create(email: 'test@example.com', password: 'password')
        sign_in user

        post :save_query, params: { query: '' }

        expect(response).to redirect_to(searches_index_path)
        expect(flash[:alert]).to eq('Query must not be blank and should end with a question mark (?).')
      end
    end
  end
end
