require "rails_helper"

RSpec.describe "Posters endpoints" do
  
  it "can send a list of all posters" do
    Poster.create!(name: 'YOU GOT THIS', description: 'We are learning!', price: 100.50, year: 2025, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')
    Poster.create!(name: 'WE ARE HEROES', description: 'Defeat the evil code we do not understand!', price: 75.50, year: 2024, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')
    Poster.create!(name: 'OR MAYBE NOT, IDK', description: 'But still dont lose hope!', price: 50.50, year: 2023, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')
    
    get "/api/v1/posters"
    
    expect(response).to be_successful

    poster_response = JSON.parse(response.body, symbolize_names: true)
    expect(poster_response[:data].count).to eq(3)

    poster_response[:data].each do |poster|
      expect(poster).to have_key(:id)
      expect(poster[:id]).to be_an(Integer)

      expect(poster[:attributes]).to have_key(:name)
      expect(poster[:attributes][:name]).to be_a(String)

      expect(poster[:attributes]).to have_key(:description)
      expect(poster[:attributes][:description]).to be_a(String)

      expect(poster[:attributes]).to have_key(:price)
      expect(poster[:attributes][:price]).to be_a(Float)

      expect(poster[:attributes]).to have_key(:year)
      expect(poster[:attributes][:year]).to be_a(Integer)

      expect(poster[:attributes]).to have_key(:img_url)
      expect(poster[:attributes][:img_url]).to be_a(String)
    end
  end
end