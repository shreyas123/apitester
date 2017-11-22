require 'faraday'

module Apitester
  class FaradayCalls
    attr_reader :base_url

    def initialize(base_url:)
      @base_url = base_url
    end

    def get(path, body = {}, headers = {}, &block)
      make_request(:get, path, body, headers, &block)
    end

    def post(path, body = {}, headers = {}, &block)
      make_request(:post, path, body, headers, &block)
    end

    def put(path, body = {}, headers = {}, &block)
      make_request(:put, path, body, headers, &block)
    end

    def delete(path, body = {}, headers = {}, &block)
      make_request(:delete, path, body, headers, &block)
    end

    private
      def conn
        @conn ||= Faraday.new
      end

      def make_request(method_name, path, body, headers, &block)
        conn.send(method_name, path, body) do |req|
          conn.url_prefix = base_url
          req.path = path
          req.headers = headers
          yield req, conn if block_given?
        end
      end
  end
end
