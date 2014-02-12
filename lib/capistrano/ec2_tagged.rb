require "capistrano/ec2_tagged/version"
require "aws-sdk"

module Capistrano
  module Ec2Tagged
    def ec2_tagged(keys_and_values = {})
      @ec2 ||= AWS::EC2.new(
        :access_key_id      => fetch(:access_key_id),
        :secret_access_key  => fetch(:secret_access_key),
        :region             => fetch(:region)
      )

      instances = @ec2.instances

      keys_and_values.each do |key, value|
        instances = instances.tagged(key.to_s)
        instances = instances.tagged_values(value.to_s) if value != true
      end

      instances.map { |instance|
        instance.ip_address || instance.private_ip_address if instance.status == :running
      }.compact
    end
  end
end

extend Capistrano::Ec2Tagged
