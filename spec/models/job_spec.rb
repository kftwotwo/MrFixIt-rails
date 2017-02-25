require 'rails_helper'

describe Job do
  it { should have_db_column :title }
  it { should have_db_column :description }
  it { should have_db_column :completed }
  it { should have_db_column :pending }
  it { should have_db_column :worker_id }
  it { should belong_to :worker }
  it { should validate_presence_of :title}
end
