# frozen_string_literal: true

require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  case Rails.env
  when 'production'
    config.fog_directory = 'nddblog-prod'
  when 'development'
    config.fog_directory = 'nddblog-dev'
  when 'test'
    config.fog_directory = 'nddblog-test'
  end
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region:                ENV['AWS_REGION']
  }
  config.fog_public     = false 
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
end
