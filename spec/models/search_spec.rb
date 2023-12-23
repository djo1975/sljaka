# spec/models/search_spec.rb
require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'association with user' do
    it 'belongs to a user' do
      user = User.create(email: 'user@example.com', password: 'password')
      search = Search.create(user:, query: 'test query')

      expect(search.user).to eq(user)
    end
  end
end
