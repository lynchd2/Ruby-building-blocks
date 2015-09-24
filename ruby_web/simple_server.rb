require 'socket'
def find_method(response)
  response[0]
end

def find_path(response)
  response[1][1..-1]
end

server = TCPServer.open(2002)  

loop {                         
  client = server.accept

  response = client.gets.split(" ")
  if File.exist?(find_path(response))
    file = File.read(find_path(response))
    client.puts "HTTP/1.1 200 OK\r\n" +
  				"Content-Type: html/plain\r\n" + 
  				"Content-Length: #{file.length}\r\n"
          client.puts "\r\n\r\n"
          client.puts file

  else
    client.puts "HTTP/1.1 404 Not Found\r\n"
    client.puts "\r\n\r\n"
    client.puts "The file '#{find_path(response)}'' was not found"
  end

  client.close                 
}