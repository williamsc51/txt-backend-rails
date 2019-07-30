require 'rails_helper'

RSpec.describe BooksController, type: :controller do
    
    
    describe 'GET index' do
        it 'gets the index' do
            get :index
        end
    end
end
