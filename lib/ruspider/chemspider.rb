# frozen_string_literal: true

require 'ruspider/rest_client'
require 'ruspider/inchi_api'
require 'ruspider/mass_spec_api'
require 'ruspider/spectra_api'
require 'ruspider/compound'
require 'ruspider/spectrum'

module Ruspider
  # ChemSpider Ruby interface
  class ChemSpider
    include InchIAPI
    include MassSpecAPI
    include SpectraAPI

    def initialize(token = '', header = {})
      @rest = RestClient.new(token, header)
      InchIAPI.instance_method(:initialize).bind(self).call(@rest)
      MassSpecAPI.instance_method(:initialize).bind(self).call(@rest)
      SpectraAPI.instance_method(:initialize).bind(self).call(@rest)
    end

    def get_compound(csid)
      Compound.new(csid, self)
    end

    def get_compounds(csids)
      csids.map { |x| Compound.new(x, self) }
    end

    def get_spectrum(spectrum_id)
      Spectrum.new(spectrum_id, self)
    end

    def get_spectra(spectrum_ids)
      spectrum_ids.map { |x| Spectrum.new(x, self) }
    end

    def get_compound_spectra(csid)
      get_spectra_info_list([csid]).map do |x|
        Spectrum.from_info_dict(x, self)
      end
    end
  end
end
