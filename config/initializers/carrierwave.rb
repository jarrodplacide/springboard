CarrierWave.configure do |config|
  config.fog_credentials = {
      :aws_access_key_id        => "AKIAJBZ2S2DJTATTUCRA",
      :aws_secret_access_key    => "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",
      :provider                 => "AWS",
      :host                     => "s3.amazonaws.com",
      :endpoint                 => "https://s3.amazonaws.com",
      :region                   => "us-east-1"
  }
  config.fog_directory = 'springboard-production'
end