# frozen_string_literal: true

module Ruspider
  # ChemSpider Spectrym Data container and parser
  class Spectrum
    def initialize(cs, spectrum_id)
      @cs = cs
      @spectrum_info[:id] = spectrum_id
    end

    def spectrum_info
      if spectrum_info.file_name.nil?
        @spectrum_info = @cs.get_spectrum_info(@spectrum_info.id)
      end

      @spectrum_info
    end

    def spectrum_id
      spectrum_info[:id]
    end

    def csid
      spectrum_info[:csid]
    end

    def spectrum_type
      spectrum_info[:spectrum_type]
    end

    def file_name
      spectrum_info[:file_name]
    end

    def comments
      spectrum_info[:comments]
    end

    def url
      'https://www.chemspider.com/FilesHandler.ashx?type=blob&disp=1&id=%s' +
        spectrum_info[:id]
    end

    def data
    end

    def original_url
      spectrum_info.get('original_url')
    end

    def submitted_date
      spectrum_info[:submitted_date]
    end
  end
end
