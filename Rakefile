# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'aws-sdk-s3'
require 'dotenv/load'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :assets do
  s3 = Aws::S3::Resource.new
  assets_bucket_name = ENV['ASSETS_BUCKET_NAME']
  task :up do
    puts "up   -> s3://#{assets_bucket_name}/assets"
    Dir.glob('assets/**/*').each do |asset_path|
      next unless File.file?(asset_path)

      s3.bucket(assets_bucket_name).object(asset_path).upload_file(asset_path)
    end
  end

  task :down do
    puts "down <- s3://#{assets_bucket_name}/assets"
    s3.bucket(assets_bucket_name).objects.each do |asset_object|
      FileUtils.mkdir_p(File.dirname(asset_object.key))
      asset_object.get(response_target: asset_object.key)
    end
  end
end
