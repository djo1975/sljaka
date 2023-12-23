# spec/controllers/analyses_controller_spec.rb
require 'rails_helper'

RSpec.describe AnalysesController, type: :controller do
  describe 'GET #index' do
    context 'when user is signed in' do
      let(:user) { User.create(email: 'test@example.com', password: 'password') }

      before do
        sign_in user
      end

      it 'responds successfully' do
        get :index
        expect(response).to be_successful
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end

      it 'filters my_searches by date range' do
        search1 = Search.create(user:, query: 'Test 1', created_at: 1.day.ago)
        search2 = Search.create(user:, query: 'Test 2', created_at: Time.current)

        get :index, params: { my_start_date: 2.days.ago.to_date, my_end_date: Time.current.to_date }

        expect(assigns(:my_searches)).to include(search1)
        expect(assigns(:my_searches)).to include(search2)
      end

      it 'filters all_searches by date range' do
        search1 = Search.create(user:, query: 'Test 1', created_at: 1.day.ago)
        search2 = Search.create(user:, query: 'Test 2', created_at: Time.current)

        get :index, params: { all_start_date: 2.days.ago.to_date, all_end_date: Time.current.to_date }

        expect(assigns(:all_searches)).to include(search1)
        expect(assigns(:all_searches)).to include(search2)
      end
    end
  end
end
