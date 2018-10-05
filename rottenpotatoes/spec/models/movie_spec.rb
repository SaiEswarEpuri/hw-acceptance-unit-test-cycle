require 'rails_helper'

describe Movie do
  describe '.find_same_director' do
    let!(:movie1) { FactoryGirl.create(:movie, title: 'Businessman', director: 'Puri') }
    let!(:movie2) { FactoryGirl.create(:movie, title: 'Bahubali', director: 'Rajamouli') }
    let!(:movie3) { FactoryGirl.create(:movie, title: "Pokiri", director: 'Puri') }
    let!(:movie4) { FactoryGirl.create(:movie, title: "SVSC") }

    context 'director exists' do
      it 'finds similar movies correctly' do
        expect(Movie.same_director(movie1.title)).to eql(['Businessman', "Pokiri"])
        expect(Movie.same_director(movie1.title)).to_not include(['Bahubali'])
        expect(Movie.same_director(movie2.title)).to eql(['Bahubali'])
      end
    end

    context 'director does not exist' do
      it 'handles sad path' do
        expect(Movie.same_director(movie4.title)).to eql(nil)
      end
    end
  end

  describe '.all_ratings' do
    it 'returns all ratings' do
      expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
    end
  end
end