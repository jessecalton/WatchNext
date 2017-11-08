# require 'rails_helper'

# RSpec.describe UsersController, type: :request do
#   before(:context) do
#     @user_without_movies = FactoryBot.create(:user)
#     @user = FactoryBot.create(:user_with_movies)
#     @movie_1 = FactoryBot.create(:movie_1) # WALL-E
#     @movie_2 = FactoryBot.create(:movie_2) # 2001 A Space Odyssey
#     @movie_3 = FactoryBot.create(:movie_3) # Labyrinth
#   end

#   describe 'GET #index' do
#     it 'has a 200 status code' do
#       get :index

#       expect(response).to render_template(:index)
#     end
#   end

#   describe 'GET #show' do
#     it 'renders the user page' do

#       get :show, params: { id: @user_without_movies.id }
#       expect(response).to render_template(:show)
#     end
#   end
# end
