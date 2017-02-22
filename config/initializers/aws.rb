CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                                           # required
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                        # required
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                    # required
    endpoint:              'https://s3.ap-northeast-2.amazonaws.com',       # optional, defaults to nil
    region:                'ap-northeast-2'
  }
  config.fog_directory  = 'americano'                                          # required
  config.fog_public     = true                                              # optional, defaults to true
  #config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }  # optional, defaults to {}
end
