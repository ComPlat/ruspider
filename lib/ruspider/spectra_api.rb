# frozen_string_literal: true

require 'ruspider/rest_client'

module Ruspider
  # SpectraAPI
  module SpectraAPI
    API = 'Spectra.asmx'

    FIELDS = {
      CommonName: 'common_name',
      MOL2d: 'mol_2d',
      MOL3d: 'mol_3d',
      ReferenceCount: 'reference_count',
      DataSourceCount: 'datasource_count',
      PubMedCount: 'pubmed_count',
      RSCCount: 'rsc_count',
      ExternalReferences: 'external_references',
      ds_name: 'datasource_name',
      ds_url: 'datasource_url',
      ext_id: 'external_id',
      ext_url: 'external_url',
      Status: 'status',
      Count: 'count',
      Message: 'message',
      Elapsed: 'elapsed',
      spc_id: 'spectrum_id',
      spc_type: 'spectrum_type',
      file_name: 'file_name',
      comments: 'comments',
      original_url: 'original_url',
      submitted_date: 'submitted_date'
    }.freeze

    def initialize(rest)
      @rest = rest
    end

    def all_spectra_info
      # response = post('Spectra', 'GetAllSpectraInfo')
      # hash_from_xml(response, FIELDS)
    end

    def get_spectrum_info(spectrum_id)
      # response = post('Spectra', 'GetSpectrumInfo', spectrum_id)
      # hash_from_xml(response, FIELDS)
    end

    def get_compound_spectra_info(csid)
      # response = post('Spectra', 'GetCompoundSpectraInfo', csid=csid)
      # hash_from_xml(response, FIELDS)
    end

    def get_spectra_info_list(csids)
      # response = post('Spectra', 'GetSpectraInfoArray', csids=csids)
      # hash_from_xml(response, FIELDS)
    end

    def all_spectra
      all_spectra_info.map { |x| Spectrum.from_hash(x) }
    end
  end
end
