require 'savon'
#https://github.com/savonrb/savon/blob/master/spec/integration/zipcode_example_spec.rb
#70070010, 24050110, 20050550

client = Savon.client(wsdl: 'http://www.thomas-bayer.com/axis2/services/BLZService?wsdl')
puts client.operations
resposta = client.call(:get_bank, message: { :blz => 24050110 })
puts resposta.body
