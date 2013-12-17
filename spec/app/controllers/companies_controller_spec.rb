require 'spec_helper'

describe "CompaniesController" do
  let(:apple) { create :company, name: 'apple' }
  let(:google) { create :company, name: 'google' }

  describe 'create company' do
    context 'with valid arguments' do
      before do
        post '/companies', {company: attributes_for(:company)}
      end

      it 'should create new record' do
        expect(Company.count).to eq 1
      end

      it 'should get success' do
        expect(last_response.status).to eq 200
      end

      it 'should return created record' do
        company = Company.first
        resp = Oj.load(last_response.body)

        expect(resp['name']).to eq company.name
      end
    end

    context 'with invalid arguments' do
      before do
        post '/companies', {}
      end

      it 'should not create new record' do
        expect(Company.count).to eq 0
      end

      it 'should get error' do
        expect(last_response.status).to eq 400
      end
    end
  end


  # before do
  #   get "/"
  # end

  # it "returns hello world" do
  #   last_response.body.should == "Hello World"
  # end
end
