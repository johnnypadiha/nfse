require "rubygems"
require "xml"
require 'savon'
require 'httpclient' #não sei se é vital...

class UtilXml
  def initialize
    @path = `pwd`
    @path = @path.gsub(/\n/, '')
  end

  def load_xml
    XML::Document.file('%s%s%s' % [@path, '/', 'WS_xml_gerarnfse.xml'])
    #client = Savon.client(wsdl: 'https://nfse.goiania.go.gov.br/ws/nfse.asmx?wsdl')
    #puts client.operations
    #puts xml.class
    #puts xml = xml.to_s
    #puts client.call(:gerar_nfse, message: { ArquivoXML: xml})
  end

  def load_xsd
     XML::Schema.document(XML::Document.file('%s%s%s' % [@path, '/', 'nfse_gyn_v02.xsd']))
  end

  def validate_xml
    self.load_xml.validate_schema(self.load_xsd)
  end

  def cliente_soap
    client = Savon.client(wsdl: 'https://nfse.goiania.go.gov.br/ws/nfse.asmx?wsdl')
  end

  def show_operations
    cliente_soap.operations
  end

   #sem o to_s da erro 400
  def gerar_nfse
    self.cliente_soap.call(:gerar_nfse, message: { ArquivoXML: self.load_xml.to_s })
  end

  def main
    if self.validate_xml
        puts 'Operações disponíveis:'
        puts self.show_operations
        puts '-'*10
        puts "Tentando 'gerar_nfse'!!!'"
        puts self.gerar_nfse
    else
        puts 'seu arquivo XML não é valido'
    end
  end

end

UtilXml.new().main
