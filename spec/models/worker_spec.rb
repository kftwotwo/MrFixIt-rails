require 'rails_helper'

describe Worker do
  it { should have_db_column :email}
  it { should have_many :jobs }
end
