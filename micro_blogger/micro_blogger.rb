require 'jumpstart_auth'
require 'bitly'
Bitly.use_api_version_3

class MicroBlogger
	attr_reader :client
	puts "Welcome to the JSL Twitter Client!"
	def initialize
		puts "Initializing MicroBlogger"
		@client = JumpstartAuth.twitter

	end

	def run
		command = ''
		while command != 'q'
			printf "Enter Command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name}
			case command
				when 'q' then puts "Goodbye!"
				when 't' then tweet(parts[1..-1].join(" "))
				when 'dm' then dm(parts[1], parts[2..-1].join(" "))
				when 'spam' then spam_my_followers
				when 'everyone' then everyones_last_tweet
				when 'shorten' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
				else
					puts "Sorry, I don't know how to #{command}"
				end
			end
		end

	def tweet(message)
		 if message.length <= 140 
		 	@client.update(message)
		 else
		 	puts "Message over 140 limit. Let me slice that for you."
		 	message.slice!(140, message.length)
		 	@client.update(message)
		 end
	end

	def dm(target,message)
		puts "Trying to send #{target} this direct message: "
		puts message
		message = "d @#{target} #{message}"
		tweet(message)
	end

	def followes_list
		screen_names = []
		@client.followers.each {|follower| screen_names << @client.user(follower).screen_name}
		screen_names
	end

	def spam_my_followers(message)
		followers_list.each {|follower| dm(follower,message)}
	end

	def everyones_last_tweet
		friends = @client.friends.sort
		friends.each do |friend|
			puts "#{@client.user(friend).screen_name.downcase} said:"
			puts @client.user(friend).status.text
			timestamp = @client.user(friend).status.created_at
			puts timestamp.strftime("%A, %b, %d")
			puts ""
		end
	end

	def shorten(original_url)
		bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
		puts "Shortening this URL: #{original_url}"
		puts bitly.shorten('original_url')
	end
end

blogger = MicroBlogger.new
blogger.run
blogger.tweet("MicroBlogger Initialized!")