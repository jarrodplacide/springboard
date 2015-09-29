CarrierWave.configure do |config|
  config.fog_credentials = {
      :aws_access_key_id        => "AKIAISR63OJ6IPLB5X6A",
      :aws_secret_access_key    => "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",
      :provider                 => "AWS",
      :host                     => "s3.amazonaws.com",
      :endpoint                 => "https://s3.amazonaws.com",
      :region                   => "us-east-1"
  }
  config.fog_directory = 'springboard-content'
end