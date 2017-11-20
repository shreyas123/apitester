require 'faraday'

module Apitester
  class FaradayCalls
    attr_reader :base_url

    def initialize(base_url:)
      @base_url = base_url
    end

    def get(path, body = {}, headers = {}, &block)
      conn = Faraday.new
      if block_given?
        conn.get path, body do |req|
          conn.url_prefix = base_url
          yield req, conn
        end
      else
        conn.get path, body do |req|
          conn.url_prefix = base_url
          req.path = path
          req.headers = headers
        end
      end
    end
  end
end
