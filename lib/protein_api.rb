class ProteinApi < Sinatra::Base
  use Rack::Parser, :parsers => {
    'application/json' => proc { |data| JSON.parse(data) }
  }

  get '/ping' do
    result = 'PONG'
    json( :result => result)
  end

  get '/translation' do
    result = Protein.rna_to_polypeptides( params[:sequence] )
    json( :result => result)
  end
end
