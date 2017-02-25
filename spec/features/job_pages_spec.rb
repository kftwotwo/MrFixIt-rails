require 'rails_helper'

describe "Worker Functionality" do
  before :each do
    create(:worker) do |worker|
      worker.jobs.create(attributes_for(:job))
      sign_in worker
    end
  end

  it "creates a job", js: true do
    visit root_path
    click_on 'Add Your Job'
    fill_in "Title", :with => "Kevin"
    fill_in "Description", :with => "Kevin"
    click_button 'Create Job'
    visit jobs_path
    expect(page).to have_content('Kevin')
  end

  it "claims a job", js: true do
    visit root_path
    click_on 'Add Your Job'
    fill_in "Title", :with => "Kevin"
    fill_in "Description", :with => "Kevin"
    click_button 'Create Job'
    visit jobs_path
    click_link 'Claim'
    expect(page).to have_content('test@test.com')
  end

  it "start a job", js: true do
    visit jobs_path
    click_link 'test'
    click_link 'Start'
    click_link 'Start'
    expect(page).to have_content('Done')
  end

  it "delete a job", js: true do
    visit worker_path(:user)
    click_link 'Done'
    expect(page).to have_content('')
  end

end
