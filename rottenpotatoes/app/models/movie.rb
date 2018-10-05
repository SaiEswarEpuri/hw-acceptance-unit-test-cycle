class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.same_director title1
    @movie=Movie.find_by(title: title1)
    dirt=@movie.director
    if(dirt==nil)
      return nil
    else
      Movie.where(director: dirt).pluck(:title)
    end 
  end 
end