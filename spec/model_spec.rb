require 'spec_helper'

class RecurrentModel < Eksa::Model
  def self.setup_schema
    db.execute "CREATE TABLE IF NOT EXISTS tests (id INTEGER PRIMARY KEY)"
  end
end

describe Eksa::Model do
  it "does not cause infinite recursion when setup_schema calls db" do
    expect { RecurrentModel.db }.not_to raise_error
  end
end
