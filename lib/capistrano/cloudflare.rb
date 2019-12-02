require 'capistrano'
require 'capistrano/cloudflare/version'
require 'json'
require 'httparty'
require 'rake'

module Capistrano
  module CloudFlare
    def self.send_request(options = {})
      headers = { 'Content-Type' => 'application/json' }

      if options[:api_key]
        headers['X-Auth-Email'] = options[:email]
        headers['X-Auth-Key']   = options[:api_key]
      elsif options[:api_token]
        headers['Authorization'] = "Bearer #{options[:api_token]}"
      end

      resp = HTTParty.post(
        "https://api.cloudflare.com/client/v4/zones/#{options[:zone]}/purge_cache",
        :body => { :purge_everything => true }.to_json,
        :headers => headers
      )

      JSON.parse(resp.body)
    end
  end
end

load File.expand_path('../tasks/cloudflare.rake', __FILE__)
