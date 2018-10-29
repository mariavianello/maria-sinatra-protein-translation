require 'app'
require 'rack/test'

RSpec.describe ProteinApi do
  include Rack::Test::Methods

  def app
    ProteinApi
  end

  describe 'get /ping' do
    it 'responds with PONG using json' do
      get '/ping'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)['result']).to eq('PONG')
    end
  end

  describe 'get /translation' do
    context 'given a valid rna sequence' do
      it 'returns the protein' do
        get '/translation', { :sequence => 'UGG' }
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)['result']).to eq( ['Tryptophan'] )
      end
    end

    context 'given a nonvalid rna sequence' do
      it 'returns the protein' do
        get '/translation', { :sequence => 'UGGUU' }
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)['result']).to eq('Not a valid RNA sequence.')
      end
    end

    context 'given a valid rna sequence with terminating codon' do
      it 'returns the protein' do
        get '/translation', { :sequence => 'UGGUAA' }
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)['result']).to eq( ['Tryptophan'] )
      end
    end
  end

end
