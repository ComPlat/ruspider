# frozen_string_literal: true

require 'nokogiri'

module Ruspider
  # XML utilities
  module XmlUtils
    def get_nodes(xml, node_name)
      xml.xpath(
        "//cs:#{node_name}",
        'cs' => 'http://www.chemspider.com/'
      )
    end

    def get_first_node(xml, node_name)
      get_nodes(xml, node_name).first
    end

    def hash_from_xml(xml, field)
      hash = {}
      field.each do |k, v|
        node = xml.xpath("//cs:#{k}", 'cs' => 'http://www.chemspider.com/')
        hash[v.to_sym] = node.first.content
      end

      hash
    end

    def hash_from_string(xml_str, obj_name, field)
      xml = get_first_node(Nokogiri::XML(xml_str), obj_name)
      hash_from_xml(xml, field)
    end

    def array_from_xml(xml_str, obj_name, field)
      xml = get_nodes(Nokogiri::XML(xml_str), obj_name)
      arr = xml.xpath("//cs:#{field}", 'cs' => 'http://www.chemspider.com/')
      arr.map(&:content)
    end
  end
end
