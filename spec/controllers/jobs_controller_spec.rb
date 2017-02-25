require 'rails_helper'

describe JobsController do
  before :each do
    create(:worker) do |worker|
      worker.jobs.create(attributes_for(:job))
      sign_in worker
    end
  end

  after :each do
    sign_out :worker
  end

  describe 'GET show' do
    it "renders a 200 response" do
      job = create(:job)
      get :show, id: job
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      job = create(:job)
      get :show, id: job
      expect(response).to render_template(:show)
    end
  end

  describe 'GET new' do
    it "renders a 200 response" do
      get :new
      expect(response.status).to eq(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  #

  describe "POST create" do
    it "renders a 200 response" do
      post :create, job: FactoryGirl.attributes_for(:job)
      expect(response.status).to eq(302)
    end

    it "renders the crate template" do
      post :create, job: FactoryGirl.attributes_for(:job)
      expect(response).to redirect_to(jobs_path)
    end
    #
    it "will create a new job" do
      post :create, job: FactoryGirl.attributes_for(:job)
      expect(assigns(:job)).to eq(Job.last)
    end
  end

  describe "GET show" do
    it "renders a 200 response" do
      job = create(:job)
      get :show, id: job
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      job = create(:job)
      get :show, id: job
      expect(response).to render_template(:show)
    end
  end

  describe "DELETE job" do
    it "renders a 200 response" do
      job = create(:job)
      delete :destroy, id: job
      expect(response.status).to eq(302)
    end
  end
end
