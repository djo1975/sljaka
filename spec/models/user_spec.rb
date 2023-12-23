# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association with searches' do
    it 'has many searches' do
      # Prvo, kreirajte korisnika i dodajte mu jednu ili više pretraga
      user = User.create(email: 'user@example.com', password: 'password')
      search1 = user.searches.create(query: 'test query 1')
      search2 = user.searches.create(query: 'test query 2')

      # Proverite vezu
      expect(user.searches).to include(search1, search2)
    end
  end
end
