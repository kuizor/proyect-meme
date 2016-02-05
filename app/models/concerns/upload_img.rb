require "rmega"

module UploadImg
	#extend ActiveSupport::Concerns
	def upload
		storage = Rmega.login("kuizor@gmail.com", "miguelhack123")
		folder = storage.root.folders[3]
		folder.upload("~/Downloads/hola.txt")
	end
end