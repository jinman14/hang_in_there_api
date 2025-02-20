require "rails_helper"

RSpec.describe "Posters endpoints" do
  before(:each) do
    @poster_1 = Poster.create!(name: 'YOU GOT THIS', description: 'We are learning!', price: 100.50, year: 2025, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')
    @poster_2 = Poster.create!(name: 'WE ARE HEROES', description: 'Defeat the evil code we do not understand!', price: 75.50, year: 2024, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')
    @poster_3 = Poster.create!(name: 'OR MAYBE NOT, IDK', description: 'But still dont lose hope!', price: 50.50, year: 2023, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')
  end

  it "can send a list of all posters" do

  end

  it "can return one poster" do
    get "/api/v1/posters/#{@poster_1.id}"

    poster_response = JSON.parse(response.body, symbolize_names: true)

    expect(poster_response).to have_key(:id)
    expect(poster_response[:id].to eq(@poster_1.id))

    expect(poster_response).to have_key(:name)
    expect(poster_response[:name]).to eq(@poster_1.name)

    expect(poster_response).to have_key(:description)
    expect(poster_response[:description]).to eq(@poster_1.description)

    expect(poster_response).to have_key(:price)
    expect(poster_response[:price]).to eq(@poster_1.price)

    expect(poster_response).to have_key(:year)
    expect(poster_response[:year]).to eq(@poster_1.year)

    expect(poster_response).to have_key(:img_url)
    expect(poster_response[:img_url]).to eq(@poster_1.img_url)
  end
end