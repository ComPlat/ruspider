# frozen_string_literal: true

require 'httparty'

module Ruspider
  # ChemSpider REST Webservice API Client
  class RestClient
    include HTTParty

    HOST_NAME = 'www.chemspider.com'

    def initialize(token, header = {})
      @token = token
      @header = header
    end

    def query_string_normalizer(query)
      query.to_hash.map do |k, v|
        if v.class == Array
          v.map { |x| "#{k}=#{x}" }.join('&')
        else
          HTTParty::HashConversions.normalize_param(k, v)
        end
      end.join
    end

    def post(api, op, options = {})
      return -1 if op.empty?
      ops = { token: @token }.merge(options)
      res = HTTParty.post(
        "https://#{HOST_NAME}/#{api}/#{op}",
        header: { header: @header }, body: ops,
        query_string_normalizer: ->(h) { query_string_normalizer(h) }
      )

      raise "#{res.response.code}: #{res.parsed_response}" unless res.success?
      res.response.body
    end
  end
end
