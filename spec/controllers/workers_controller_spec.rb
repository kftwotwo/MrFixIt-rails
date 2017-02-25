require 'rails_helper'

describe WorkersController do
  before :each do
    worker = create(:worker)
    sign_in worker
  end

  after :each do
    sign_out :worker
  end

  describe 'GET show' do
    it "renders a 200 response" do
      get :show, id: :worker
      expect(response.status).to eq(200)
    end
    #
    it "renders the show template" do
      get :show, id: :worker
      expect(response).to render_template(:show)
    end
  end

  describe 'GET new' do
    it "renders a 200 response" do
      get :new, id: :worker
      expect(response.status).to eq(302)
    end
  end
end
