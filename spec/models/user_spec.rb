require 'rails_helper'

describe User do
  it {should have_db_column :email }
end
