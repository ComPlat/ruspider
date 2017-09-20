# frozen_string_literal: true

require 'ruspider/rest_client'

module Ruspider
  # InChI API http://www.chemspider.com/InChI.asmx
  module InchIAPI
    API = 'InChi.asmx'

    def initialize(rest)
      @rest = rest
    end

    def get_original_mol(csid)
      response = post(INCHI_API, 'CSIDToMol', csid)
      response.text
    end
  end
end
