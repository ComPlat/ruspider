# frozen_string_literal: true

module Ruspider
  # ChemSpider Compound Data container and parser
  class Compound
    def initialize(csid, cs)
      @csid = csid
      @cs = cs
      @extended_compound_info = nil
    end

    def image_url
      'http://www.chemspider.com/ImagesHandler.ashx?id=%s' + @csid
    end

    def extended_compound_info
      if @extended_compound_info.nil?
        @extended_compound_info = @cs.get_extended_compound_info(@csid)
      end

      @extended_compound_info
    end

    def molecular_formula
      extended_compound_info[:molecular_formula]
    end

    def smiles
      extended_compound_info[:smiles]
    end

    def inchi
      extended_compound_info[:inchi]
    end

    def inchikey
      extended_compound_info[:inchikey]
    end

    def average_mass
      extended_compound_info[:average_mass]
    end

    def molecular_weight
      extended_compound_info[:molecular_weight]
    end

    def monoisotopic_mass
      extended_compound_info[:monoisotopic_mass]
    end

    def nominal_mass
      extended_compound_info[:nominal_mass]
    end

    def alogp
      extended_compound_info[:alogp]
    end

    def xlogp
      extended_compound_info[:xlogp]
    end

    def common_name
      extended_compound_info[:common_name]
    end

    def mol_2d
      @cs.get_record_mol(@csid, False)
    end

    def mol_3d
      @cs.get_record_mol(@csid, True)
    end

    def mol_raw
      @cs.get_original_mol(@csid)
    end

    def image
      @cs.get_compound_thumbnail(@csid)
    end

    def spectra
      spectra_list = @cs.get_spectra_info_list(@csid)
      spectra_list.map { |s| Spectrum.new(s) }
      # [Spectrum.from_info_dict(self._cs, info)
      # for info in self._cs.get_spectra_info_list([self.csid])]
    end
  end
end
