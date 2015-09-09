require 'csv'
require 'sunlight/congress'
require 'erb'
require 'date'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

puts "EventManager Initialized!"

def clean_zipcode(zip_code)
	zip_code.to_s.rjust(5,'0')[0..4]
end

def legislators_by_zipcode(zip_code)
	legislators = Sunlight::Congress::Legislator.by_zipcode(zip_code)
end

def clean_phone_numbers(phone_number)
	x = phone_number.split("")
	clean_number = x.collect {|num| num.to_i if num.to_s == num.to_i.to_s}
	clean_number = clean_number.join("")

	if (clean_number.length < 10) || (clean_number.length > 10 && clean_number[0] != "1")
		puts "Bad phone number for the number #{clean_number}"
	elsif clean_number.length > 10 && clean_number[0] == "1"
		clean_number = clean_number[1..-1]
		puts "Number trimmed for #{phone_number} to #{clean_number}"
	end
end

def save_thank_you_letters(id, form_letter)
	Dir.mkdir("output") unless Dir.exists?("output")

		filename = "output/thanks_#{id}.html"

		File.open(filename, 'w') do |file|
			file.puts form_letter
		end
	end

def hour(reg_date)
	DateTime.strptime(reg_date, '%m/%d/%Y %H:%M').hour
end


def most_popular_hour(contents, hours_array)
	freq = hours_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
	hour = hours_array.max_by { |v| freq[v] }	
	if contents.eof? && hour > 12 
		puts "#{hour - 12}PM was the most registered hour"
	elsif contents.eof?
		puts "#{hour}AM was the most registered hour"
	end
end
def days(reg_date)
	Date.strptime(reg_date,"%m/%d/%Y").strftime("%A")
end

def most_popular_day(contents, days_array)
	freq = days_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
	day = days_array.max_by { |v| freq[v] }	
	if contents.eof?
		puts "#{day} was the most popular day"
	end
end

contents = CSV.open("/home/dylan/Programming/event_manager/event_attendees.csv", headers: true, header_converters: :symbol)

letter = File.read("/home/dylan/Programming/event_manager/form_letter.erb")
erb_template = ERB.new(letter)
hours_array = []
days_array = []
contents.each do |line|
	id = line[0]
	name = line[:first_name]
	phone_numbers = line[5]
	reg_date = line[1]

	zipcode = clean_zipcode(line[:zipcode])
	clean_phone_numbers(phone_numbers)
	hours_array << hour(reg_date)
	days_array << days(reg_date)
	most_popular_hour(contents, hours_array)
	most_popular_day(contents, days_array)

	legislators = legislators_by_zipcode(zipcode)
	form_letter = erb_template.result(binding)

	save_thank_you_letters(id, form_letter)
end