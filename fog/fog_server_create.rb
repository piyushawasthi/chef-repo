require 'fog'

class FogServerCreate
	def initialize
		@provider = 'AWS'
		@aws_access_key_id = 'aws_access_key_id'
		@aws_secret_access_key = 'aws_secret_access_key'
		create_server!
	end

	def run
		begin
			server = @fog.servers.create(:flavor_id => "t2.micro", :image_id => "ami-5ac2cd4d", :name => 'my_server')
			server.wait_for { ready? }
			p "Created Server #{server.id}"
		rescue Exception => e
			
		end
	end

	def create_server!
		@fog ||= Fog::Compute.new(
			provider: @provider,
			aws_access_key_id: @aws_access_key_id,
			aws_secret_access_key: @aws_secret_access_key			
		)
	end
end

FogServerCreate.new.run