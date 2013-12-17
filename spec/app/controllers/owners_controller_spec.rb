require 'spec_helper'

describe "OwnersController" do
  before do
    get "/"
  end

  xit "returns hello world" do
    last_response.body.should == "Hello World"
  end
end
