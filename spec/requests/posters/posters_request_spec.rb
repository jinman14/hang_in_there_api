require "rails_helper"

RSpec.describe "Posters endpoints" do
  before(:each) do
    Poster.create!(name: 'YOU GOT THIS', description: 'We are learning!', price: 100.50, year: 2025, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')
    Poster.create!(name: 'WE ARE HEROES', description: 'Defeat the evil code we do not understand!', price: 75.50, year: 2024, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')
    Poster.create!(name: 'OR MAYBE NOT, IDK', description: 'But still dont lose hope!', price: 50.50, year: 2023, img_url: 'https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d')

    get "/api/v1/posters"
  end

  it "can send a list of all posters" do
    
  end
end