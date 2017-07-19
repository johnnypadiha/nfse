require 'savon'
#https://github.com/savonrb/savon/blob/master/spec/integration/zipcode_example_spec.rb
#70070010, 24050110, 20050550

#client = Savon.client(wsdl: 'http://www.thomas-bayer.com/axis2/services/BLZService?wsdl')
#puts client.operations
#resposta = client.call(:get_bank, message: { :blz => 24050110 })
#puts resposta.body



client = Savon.client(wsdl: 'https://apphom.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl')
#puts client.operations
resposta = client.call(:consulta_cep, soap_action: "", message: { :cep => "74663520" })
puts resposta.body

#client = Savon.client(wsdl: 'http://www.dneonline.com/calculator.asmx')
#puts client.operations
#resposta = client.call(:consulta_cep, soap_action: "", message: { :cep => "74663520" })
#puts resposta.body
