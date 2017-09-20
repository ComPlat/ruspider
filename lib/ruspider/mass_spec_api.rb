# frozen_string_literal: true

require 'ruspider/rest_client'
require 'ruspider/xml_utils'

module Ruspider
  # MassSpec API: http://www.chemspider.com/MassSpecAPI.asmx
  module MassSpecAPI
    include XmlUtils
    API = 'MassSpecAPI.asmx'

    FIELDS = {
      CSID: 'csid',
      MF: 'molecular_formula',
      SMILES: 'smiles',
      InChI: 'inchi',
      InChIKey: 'inchikey',
      AverageMass: 'average_mass',
      MolecularWeight: 'molecular_weight',
      MonoisotopicMass: 'monoisotopic_mass',
      NominalMass: 'nominal_mass',
      ALogP: 'alogp',
      XLogP: 'xlogp'
    }.freeze

    def initialize(rest)
      @rest = rest
    end

    def databases
      response = @rest.post(API, 'GetDatabases')
      array_from_xml(response, 'ArrayOfString', 'string')
    end

    def get_extended_compound_info(csid)
      response = @rest.post(API, 'GetExtendedCompoundInfo', csid: csid)
      hash_from_string(response, 'ExtendedCompoundInfo', FIELDS)
    end

    def get_extended_compound_info_list(csids)
      response = @rest.post(API, 'GetExtendedCompoundInfoArray', csids: csids)
      nodes = get_nodes(response)
      nodes.map { |node| hash_from_xml(node, FIELDS) }
    end
  end
end
