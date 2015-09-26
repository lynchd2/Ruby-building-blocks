require 'socket'
require 'json'

def find_method(response)
  response.split[0]
end

#For some odd reason, the method below
#would not work when using it to open files.
#There would be a "undefined method '[]' for
#nil:NilClass(NoMethodError)" error. I instead
#just stored the result of the path from the client
#in a variable and used it that way.

#def find_path(response)
  #response.splt[1][1..-1]
#end

server = TCPServer.open(2002)  

loop {    

  client = server.accept
  response = ""
  while line = client.gets
     response << line
     break if response =~/\r\n\r\n$/
  end

  find_path = response.split[1][1..-1]

  if File.exist?(find_path) && (find_method(response) == 'GET')
    file = File.read(find_path)
    client.puts "HTTP/1.1 200 OK\r\n" +
  				"Content-Type: html/plain\r\n" + 
  				"Content-Length: #{file.length}\r\n"
          client.puts "\r\n\r\n"
          client.puts file

  elsif File.exist?(find_path) && (find_method(response) == 'POST')
    response = ""
    while line = client.gets
      response << line
      break if response =~/\r\n\r\n$/
    end

    body = response.chomp.chomp

    params = {}
    params = JSON.parse(body)
    list_entries = ""
    params["viking"].each do |key, value|
      list_entries += "<li>#{key}: #{value}</li>\n\t\t"
    end

    file = File.open(find_path)
    response_body = file.read.gsub("<%= yield %>", list_entries)

    client.puts "HTTP/1.1 200 OK\r\n" +
          "Content-Type: html/plain\r\n" + 
          "Content-Length: #{response_body.length}\r\n"
          client.puts "\r\n\r\n"
          client.puts response_body

  else
    client.puts "HTTP/1.1 404 Not Found\r\n"
    client.puts "\r\n\r\n"
    client.puts "The file '#{find_path(response)}'' was not found"
  end

  client.close                 
}