#myapp.rb

require "rubygems"
require "sinatra"


class MyApp < Sinatra::Base

	
get '/githook/ucUg7L9S7/' do
	"Hello World"
end


post '/githook/ucUg7L9S7/' do
	request.body.rewind
	payload_body = request.body.read
	verify_signature(payload_body)
	payload_body
        signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['SECRET_TOKEN'], payload_body)
	system("/home/charles/server/scripts/deploy4-main.sh")
	"my life is a lie"
end


def verify_signature(payload_body)
	print ENV['SECRET_TOKEN']
	signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['SECRET_TOKEN'], payload_body)
	return halt 500, "Signatures didnt match!" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE'])
end
end
