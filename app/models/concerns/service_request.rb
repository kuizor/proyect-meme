require 'json'
require 'net/http'
module ServiceRequest
	extend ActiveSupport::Concerns
	
	def meme_serv(texto1,texto2,id)
		@json_request = {
		  src_image_id: id,#'Dv99KQ'
		  private: false,
		  captions_attributes: [
		    {
		      text: texto1,
		      top_left_x_pct: 0.05,
		      top_left_y_pct: 0,
		      width_pct: 0.9,
		      height_pct: 0.25
		    },
		    {
		      text: texto2,
		      top_left_x_pct: 0.05,
		      top_left_y_pct: 0.75,
		      width_pct: 0.9,
		      height_pct: 0.25
		    }
		  ]
		}
		conect
	end
	private
	def conect

		create_uri = URI('http://memecaptain.com/gend_images')	#crea el URL
		create_request = Net::HTTP::Post.new(create_uri)		#crea el Request
		create_request['Accept'] = 'application/json'			#
		create_request['Content-Type'] = 'application/json'
		create_request.body = @json_request.to_json

		Net::HTTP.start(create_uri.hostname, create_uri.port) do |http|
		  create_response = http.request(create_request)

		  poll_uri = URI(create_response['Location'])
		  poll_request = Net::HTTP::Get.new(poll_uri)
		  10.times do
		    poll_response = http.request(poll_request)
		    puts "poll response #{poll_response.code}"
		    if poll_response.code == '303'
		      @link = poll_response['Location']
		      break
		    end
		    parsed_body = JSON.parse(poll_response.body)
		    fail(parsed_body['error']) if parsed_body['error']
		    sleep 3
		  end
		end
		return @link
	end
end