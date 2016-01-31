require 'rest-client'
class Service
	def call_service(op,key,secret,args)									#metodo de Reguest
		@key = key															# PRUEBA:'XP00G79ZEMZCQRDS'
		@secret = secret													# PRUEBA:'CHKMWH4MYRHKFNF2'
		@op = op 															# solo opciones pdf o png
		if (@op == 'pdf')													# Validar request PDF
			puts "Creando PDF... Por favor espere."
			begin
				response = RestClient.get option1, :params => args
			rescue RestClient::ExceptionWithResponse => err					#Aqui el manejo de excepciones
				puts "Error 001->("+err.response+")"
			end
			begin
				if(response.body!=nil)
					open('archivo.pdf', 'wb') do |file|							#Aqui creamos el archivo
			  			file.write(response.body)
					end
					puts "Archivo PDF creado con Exito!! (Nombre:archivo.pdf)"
				else
					puts "Error 002-> ("+err.response+")"
				end
			rescue Exception => e
				puts "Error 003->("+e+")"
			end
		elsif (@op == 'png')												#Validar request PNG
			puts "Creando Imagen... Por favor espere."
			begin
				response = RestClient.get option2, :params => args
			rescue RestClient::ExceptionWithResponse => err					#Aqui el manejo de excepciones
				puts "Error 004->("+err.response+")"
			end
			begin
				if(response.body!=nil)
					open('archivo.png', 'wb') do |file|							#Aqui creamos el archivo
			  			file.write(response.body)
					end
					puts "Archivo creado con Exito!! (Nombre:archivo.png)"
				else
					puts "Error 005->("+err.response+")"
				end
			rescue Exception => e
				puts "Error 006->("+e+")"
			end
		elsif (@op == 'font')												#Validar request FONTS
			begin
				response = JSON.parse(RestClient.get option4)
				return response
			rescue Exception => e	
				puts "Error 007->("+e+")"
			end			
		else
			puts "El tipo de archivo ingresado es invalido"
		end
	end
	#Cortesia del API MAIL-> http://www.mailgun.com
	def send_message(op,email,asunto,mensaje)								#Metodo Email
		if(op==1)
			@opc ="archivo.pdf"												#Nombre del archivo PDF
		elsif (op==2)
			@opc ="archivo.png"												#nombre del archivo PNG
		end
		begin
			response = RestClient.post option3,
			:from => "Miguel Brazzoduro <kuizor@gmail.com>",
			:to => "#{email}",
			:subject => "#{asunto}",
			:text => "#{mensaje}",
			:attachment => File.new(File.join("./",@opc))
		rescue RestClient::ExceptionWithResponse => err
			puts "Error 008-> ("+err.response+")"
		end
		puts "Su email fue enviado..."
	end

	private
	def option1																# URL PDF
		'https://'+@key+':'+@secret+'@api.handwriting.io/render/pdf'
	end
	def option2																# URL PNG
		'https://'+@key+':'+@secret+'@api.handwriting.io/render/png'
	end
	def option3																# URL Email
		"https://api:key-a636b3cdd3a88d2eab491e7ab242184e"\
			"@api.mailgun.net/v3/sandboxf5a853baca6948beb1c8f8d68e21bc59.mailgun.org/messages"
	end
	def option4																# URL FONTs
		"https://"+@key+":"+@secret+"@api.handwriting.io/handwritings?limit=200&offset=0&order_dir=asc&order_by=id"
	end
end