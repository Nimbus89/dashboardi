class WebsocketController < ApplicationController
	include Tubesock::Hijack

	def rand3

		connected = false

		hijack do |tubesock|
			tubesock.onopen do
				puts "Websocket: Connection Open"
				connected = true
				while !tubesock.instance_variable_get("@socket").closed? do
					tubesock.send_data "{\"key\":\"key1\", \"val\":" + rand(10000).to_s + "}";
					puts "Websocket: Message Sent"
					sleep 1;
				end
			end

			tubesock.onclose do
				puts "Websocket: Connection Closed"
				connected = false
			end
		end
	end
end
