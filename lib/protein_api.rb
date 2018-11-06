class ProteinApi < Sinatra::Base
  use Rack::Parser, :parsers => {
    'application/json' => proc { |data| JSON.parse(data) }
  }

 before do
    response.headers['Access-Control-Allow-Origin'] = "*"
    response.headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  options "*" do
    200
  end

  get '/ping' do
    result = 'PONG'
    json( :result => result)
  end

  get '/translation' do
    result = Protein.rna_to_polypeptides( params[:sequence] )
    json( :result => result)
  end
end
