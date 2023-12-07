require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: 'Felix',
        age: 2,
        enjoy: 'walks in the park',
        image: 'https://images.unsplash.com/photo-1610130678123-042427361cb1?q=80&w=2070&auto=format&f[…]3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      )

      get '/cats'

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end 
  end

  describe "POST /create" do
    it "creates a cat" do
      cat_params = {
        cat: {
          name: 'Buster',
          age: 4,
          enjoy: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
  
      # Send the request to the server
      post '/cats', params: cat_params
  
      expect(response).to have_http_status(200)
  
      # Look up the cat we expect to be created in the db
      cat = Cat.first
  
      # Assure that the created cat has the correct attributes
      expect(cat.name).to eq 'Buster'
      expect(cat.age).to eq 4
      expect(cat.enjoy).to eq 'Meow Mix, and plenty of sunshine.'
      expect(cat.image).to eq 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
    end
  end

  describe "Patch /update" do
    it "updates a cat" do
      cat_params = {
        cat: {
          name: 'Buster',
          age: 6,
          enjoy: 'Swordplay and yelling HOOOOO!!!',
          image: 'https://numeralpaint.com/wp-content/uploads/2021/07/lionel-thundercat-paint-by-numbers.jpg'
        }
      }
      post '/cats', params: cat_params
      cat = Cat.first

      updated_params = {
        cat: {
          name: 'Lion-O',
          age: 6,
          enjoy: 'Swordplay and yelling HOOOOO!!!',
          image: 'https://numeralpaint.com/wp-content/uploads/2021/07/lionel-thundercat-paint-by-numbers.jpg'
        }
      }

      patch "/cats/#{cat.id}", params: updated_params

      updated_cat = Cat.find(cat.id)
      expect(response).to have_http_status 200
      expect(updated_cat.name).to eq "Lion-O"
    end
  end 

  describe "Delete /destroy" do
    it "deletes a cat" do
      cat_params = {
        cat: {
          name: 'Buster',
          age: 4,
          enjoy: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      post '/cats', params: cat_params
      cat = Cat.first

      delete "/cats/#{cat.id}"
      
      expect(response).to have_http_status (200)
      cats=Cat.all
      expect(cats).to be_empty
      
    end
  end 
end 
