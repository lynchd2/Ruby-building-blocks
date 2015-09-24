require 'socket'
 
host = 'localhost'
port = 2002                     
path = "/index.html"                 


request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host,port) 
socket.puts(request)              
            
response = socket.read 
headers,body = response.split("\r\n\r\n",2) 
print headers
print body   

socket.close
