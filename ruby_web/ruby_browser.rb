require 'socket'
require 'json'

host = 'localhost'
port = 2002                     
path = "/index.html"

def method(number)
	if number == 1
		"GET"
	elsif number == 2
		"POST"
	end
end

def path(number)
	if number == 1
		"/index.html"
	elsif number == 2
		"/thanks.html"
	end
end

def details_for_post
	puts "Let's create a viking. What is his name?"
	name = gets.chomp
	puts "And their email?"
	email = gets.chomp
	information = {:viking => {:name => name, :email =>email}}.to_json
end


puts "Hello, client. What kind of request do you want to send?"
puts "Press '1' for GET, or press '2' for POST"

number = gets.chomp.to_i 
until number == 1 || number == 2
	puts "Press '1' for GET, or press '2' for POST"
	number = gets.chomp.to_i
end

request = "#{method(number)} #{path(number)} HTTP/1.1" + 
		  "\r\n\r\n" + 
		  "#{details_for_post}"



socket = TCPSocket.open(host,port)

socket.puts(request)            
            
response = socket.read 

headers,body = response.split("\r\n\r\n",2) 
print headers
print body   

socket.close
