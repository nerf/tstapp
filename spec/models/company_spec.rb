require 'spec_helper'

describe Company do

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should validate_presence_of :address }

  it { should validate_presence_of :city }

  it { should validate_presence_of :country }

  it { should allow_value('test@example.com').for(:email) }
  it { should_not allow_value('testexample.com').for(:email) }

  it { should allow_value('+44 0555-555 55').for(:phone) }
  it { should_not allow_value('44a22').for(:phone) }

  it { should have_many(:owners) }

end
