Aws.config.update({
  region: 'us-west-2',
  credentials: Aws::Credentials.new(ENV['AWS_KEY'], ENV['AWS_SECRET']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['REVIEW_BUCKET'])
