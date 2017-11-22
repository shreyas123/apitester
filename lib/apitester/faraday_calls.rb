require 'faraday'

module Apitester
  class FaradayCalls
    attr_reader :base_url

    def initialize(base_url:)
      @base_url = base_url
    end

    def get(path, body = {}, headers = {}, &block)
      conn = Faraday.new
      conn.get path, body do |req|
        conn.url_prefix = base_url
        req.path = path
        req.headers = headers
        yield req, conn if block_given?
      end
    end

    def post(path, body = {}, headers = {}, &block)
      conn.post path, body do |req|
        conn.url_prefix = base_url
        req.path = path
        req.headers = headers
        yield req, conn if block_given?
      end
    end

    private
      def conn
        @conn ||= Faraday.new
      end
  end
end
