require 'spec_helper'

describe "CompaniesController" do
  let(:apple) { create :company, name: 'Apple Inc.' }
  let(:google) { create :company, name: 'Google Inc.' }

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

  describe 'show company details' do
    context 'valid id' do
      before do
        get "/companies/#{apple.id}"
      end

      it 'should get success' do
        expect(last_response.status).to eq 200
      end

      it 'should view company data' do
        resp = Oj.load(last_response.body)

        expect(resp['name']).to eq apple.name
      end
    end

    context "invalid id" do
      before do
        get "/companies/5a"
      end

      it 'should receive error status' do
        expect(last_response.status).to eq 404
      end
    end
  end

  describe 'list' do
    before do
      apple.id
      google.id

      get '/companies'

    end

    it 'should return all companies' do
      resp = Oj.load(last_response.body, symbol_keys: true)
      expected_resp = [
        {id: apple.id, name: apple.name},
        {id: google.id, name: google.name},
      ]

      expect(resp).to match_array expected_resp
    end

    it 'should get success' do
      expect(last_response.status).to eq 200
    end
  end

end
