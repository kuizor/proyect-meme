require 'rest-client'
module ServiceEmail
	#extend ApplicationSupport::Concerns
		def send_message(email,link)
				response = RestClient.post "https://api:key-a636b3cdd3a88d2eab491e7ab242184e"\
				"@api.mailgun.net/v3/sandboxf5a853baca6948beb1c8f8d68e21bc59.mailgun.org/messages",
				:from => "Miguel Brazzoduro <kuizor@gmail.com>",
				:to => "#{email}",
				:subject => "Imagen creada por API-MEME",
				:text => "La direccion del enlace es el siguiente:#{link}"
				#:attachment => File.new(File.join("./",@opc))
		end	
end