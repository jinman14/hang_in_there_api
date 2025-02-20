require 'rails_helper'

RSpec.describe "Posters endpoints" do
  it "can send a list of all posters" do
    Poster.create!(name: 'YOU GOT THIS', description: 'We are learning!', price: 100.50, year: 2025, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')
    Poster.create!(name: 'WE ARE HEROES', description: 'Defeat the evil code we do not understand!', price: 75.50, year: 2024, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')
    Poster.create!(name: 'OR MAYBE NOT, IDK', description: 'But still dont lose hope!', price: 50.50, year: 2023, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')

    get "/api/v1/posters"

    expect(response).to be_successful
    
    posters = JSON.parse(response.body, symbolize_names: true)

    puts posters.inspect

    expect(posters[:data].count).to eq(3)
  
  end

  it "can return one poster" do
    poster_1 = Poster.create!(name: 'YOU GOT THIS', description: 'We are learning!', price: 100.50, year: 2025, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')

    get "/api/v1/posters/#{poster_1.id}"

    expect(response).to be_successful

    poster_response = JSON.parse(response.body, symbolize_names: true)

    expect(poster_response[:data]).to have_key(:id)
    expect(poster_response[:data][:id]).to eq(poster_1.id)

    expect(poster_response[:data][:attributes]).to have_key(:name)
    expect(poster_response[:data][:attributes][:name]).to eq(poster_1.name)

    expect(poster_response[:data][:attributes]).to have_key(:description)
    expect(poster_response[:data][:attributes][:description]).to eq(poster_1.description)

    expect(poster_response[:data][:attributes]).to have_key(:price)
    expect(poster_response[:data][:attributes][:price]).to eq(poster_1.price)

    expect(poster_response[:data][:attributes]).to have_key(:year)
    expect(poster_response[:data][:attributes][:year]).to eq(poster_1.year)

    expect(poster_response[:data][:attributes]).to have_key(:img_url)
    expect(poster_response[:data][:attributes][:img_url]).to eq(poster_1.img_url)
  end

  it "can create a poster" do
    
    poster_params = { 
      name: 'I AM A POSTER',
      description: 'A mighty little poster',
      price: 29.99,
      year: 2026,
      img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d'
    }
    post "/api/v1/posters", params: { poster: poster_params }

    poster_response = JSON.parse(response.body, symbolize_names: true)

    expect(poster_response[:data]).to have_key(:id)
    expect(poster_response[:data][:attributes][:name]).to eq(poster_params[:name])
    expect(poster_response[:data][:attributes][:description]).to eq(poster_params[:description])
    expect(poster_response[:data][:attributes][:price]).to eq(poster_params[:price])
    expect(poster_response[:data][:attributes][:year]).to eq(poster_params[:year])
    expect(poster_response[:data][:attributes][:img_url]).to eq(poster_params[:img_url])
  end

  it "can delete posters" do
    Poster.create!(name: 'YOU GOT THIS', description: 'We are learning!', price: 100.50, year: 2025, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')
    Poster.create!(name: 'WE ARE HEROES', description: 'Defeat the evil code we do not understand!', price: 75.50, year: 2024, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')
    Poster.create!(name: 'OR MAYBE NOT, IDK', description: 'But still dont lose hope!', price: 50.50, year: 2023, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')

    get "/api/v1/posters"
    
    posters = JSON.parse(response.body, symbolize_names: true)

    expect(posters[:data].count).to eq(3)

    first_id = posters[:data].first[:id]

    delete "/api/v1/posters/#{first_id}"

    get "/api/v1/posters"

    posters = JSON.parse(response.body, symbolize_names: true)

    expect(posters[:data].count).to eq(2)
  end
end