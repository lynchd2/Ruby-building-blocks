require 'socket'      

hostname = 'localhost'
port = 3001
request = "GET /index.html HTTP/1.0\r\n"
s = TCPSocket.open(hostname, port)

s.print(request)
s.puts "\r\n"
while line = s.gets
  puts line.chop      
end
s.close         