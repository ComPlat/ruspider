# frozen_string_literal: true

require 'ruspider/rest_client'
require 'ruspider/xml_utils'

module Ruspider
  # InChI API http://www.chemspider.com/InChI.asmx
  module InchIAPI
    include XmlUtils

    API = 'InChi.asmx'

    def initialize(rest)
      @rest = rest
    end

    def get_original_mol(csid)
      response = @rest.post(API, 'CSIDToMol', csid)
      response.text
    end

    def inchi_to_csid(inchi)
      response = @rest.post(API, 'InChIToCSID', inchi: inchi)
      get_nodes(Nokogiri::XML(response), 'string').first.content.to_i
    end

    def inchi_key_to_csid(inchi_key)
      response = @rest.post(API, 'InChIKeyToCSID', inchi_key: inchi_key)
      get_nodes(Nokogiri::XML(response), 'string').first.content.to_i
    end
  end
end
