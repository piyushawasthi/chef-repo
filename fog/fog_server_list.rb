require 'fog'

class FogServerCreate
	def initialize
		@provider = 'AWS'
		@aws_access_key_id = 'aws_access_key_id'
		@aws_secret_access_key = 'aws_secret_access_key'
	end

	def run
		begin
			total_servers = @fog.servers
			return if total_servers.length < 1
			total_servers.each do |server|
				p "Name => " + server.tags["Name"].to_s
				p "ID => " + server.id.to_s
				p "Public IP => " + server.public_ip_address.to_s
				p "Private IP => " + server.private_ip_address.to_s
				p "Flavor Id => " + server.flavor_id.to_s
				p "DNS => " + server.dns_name.to_s
			end
		rescue Exception => e
			
		end
	end

	def create_server
		@fog ||= Fog::Compute.new(
			provider: @provider,
			aws_access_key_id: @aws_access_key_id,
			aws_secret_access_key: @aws_secret_access_key			
		)
	end
end

FogServerCreate.new.run