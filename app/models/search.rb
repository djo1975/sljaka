# app/models/search.rb
require 'csv'

class Search < ApplicationRecord
  belongs_to :user

  def self.to_csv
    attributes = %w[user_email query created_at]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |search|
        csv << [search.user.email, search.query, search.created_at]
      end
    end
  end
end
