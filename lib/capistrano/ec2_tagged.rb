require "capistrano/ec2_tagged/version"
require "aws-sdk"

module Capistrano
  module Ec2Tagged
    def ec2_tagged(keys_and_values = {})
      @ec2 ||= AWS::EC2.new(
        :access_key_id      => fetch(:aws_access_key_id),
        :secret_access_key  => fetch(:aws_secret_access_key),
        :region             => fetch(:aws_region)
      )

      instances = @ec2.instances

      keys_and_values.each do |key, value|
        instances = instances.tagged(key.to_s)
        instances = instances.tagged_values(value.to_s) if value != true
      end

      AWS.memoize do
        instances.map { |instance|
          instance.ip_address || instance.private_ip_address if instance.status == :running
        }.compact
      end
    end
  end
end

extend Capistrano::Ec2Tagged
