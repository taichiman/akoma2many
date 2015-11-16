require_relative '../parser.rb'
require 'json'
require 'rexml/document'
include REXML

RSpec.describe Parser, "#parse" do
  context 'json' do
    it 'correct json created' do
      xml_name = 'spec/stuff/acta-02-12-julio-31-de-2012-f.xml'
      source = REXML::Document.new(open(xml_name))
      parser = Parser.new(source, file_name: File.basename(xml_name))
      etalon = IO.read('spec/stuff/acta-02-12-julio-31-de-2012-f.json')

      result = parser.parse
      expect(JSON.parse(JSON.pretty_generate(result))).to eq(JSON.parse(etalon)) 
    end

  end
end

