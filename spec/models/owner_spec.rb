require 'spec_helper'

describe Owner do

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).scoped_to(:company_id) }

  it { should belong_to :company }

end
