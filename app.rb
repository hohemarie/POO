require_relative '../lib/event'
require_relative '../lib/user'
require 'time'
require 'pry'

class User
	attr_accessor :email, :name
	def initialize(adresse)
		@email = adresse
	end

	def update_email(email_to_update)
		@email = email_to_update
	end

	def read_email
		return @email
	end
		
	def self.find_by_email(email)
		tous=User.all
		tous = User.each do |user_name|
			if user_name.read_email == email
				puts User.read_email
			end
		end
	end
end
class Event
	attr_accessor :start_date, :length, :title, :attendees
	def initialize(date,duree,titre,attendees)
		
		attendees.each do |attendee|
			User.new(attendee)
		end
	end
	def postpone_24h
		start=start_date.split(" ")
		start1=start[0]
		start2=start1.split('-')
		start2[0]=year
		start2[1]=month
		start2[2]=day
		fevrier="02"
		if ['01','03','05','07','08','10','12'].include?(month) and day.to_i<31
			day.to_i+=1
		elsif ['04','06','09','11'].include?(month) and day.to_i<30	
			day.to_i+=1	
		elsif fevrier.include?(month) and day.to_i<28
			day.to_i+=1
		elsif ['01','03','05','07','08','10'].include?(month) and day.to_i == 31
			month.to_i+=1
			day.to_i=1
		elsif ['04','06','09','11'].include?(month.to_i) and day.to_i==30
			month.to_i+=1	
			day.to_i=1
		elsif fevrier.include?(month.to_i) and day.to_i == 28
			month.to_i+=1
			day.to_i=1
		elsif month.to_i == 12 and day.to_i == 32
			day.to_i=1
			month.to_i=1
			year.to_i+=1
		end
	end
	def end_date(start_date, length)
		#time=time.to_i+60*60*24		
		start=start_date.split(" ")
		start1=start[0]
		start2=start1.split("-")
		minutes_start_date=start[2].to_i*60*60*24
		if [1,3,5,7,8,10,12].include?(start2[1].to_i) 
			minutes_start_date+=31*(start2[1].to_i-1)
		elsif [4,6,9,11].include?(start2[1].to_i)
			minutes_start_date.to_i+=30*(start2[1].to_i-1)
		elsif start2[1].to_i==2	
			minutes_start_date.to_i+=31
		end
		minutes_start_date.to_i+=60*60*24	
		end_date = minutes_start_date+length	
		return end_date
	end
		
	def is_past(start_date)	
		start=start_date.split(" ")
		start1=start[0]
		start2=start1.split("-")
		date=start2[0]
		heure=start2[1]
		minutes=heure.split(":")[1]
		heures=heure.split(":")[0]
		#minutes_start_date=start[2].to_i*30*60*24
		minutes.to_i+=heures.to_i*60
		minutes_start_date=start[2].to_i*60*60*24
		if [1,3,5,7,8,10,12].include?(start2[1].to_i)
			minutes_start_date+=31(start2[1].to_i)
		elsif [4,6,9,11].include?(start2[1].to_i)
			minutes_start_date.to_i+=30*(start2[1].to_i-1)
		elsif start2[1].to_i==2
			minutes_start_date.to_i+=31
		end
		minutes_start_date.to_i+=30*30*24
		time1=minutes+minutes_start_date
		if time1<Time.now
			puts "avant"
		end
	end
	def is_future(start_dateA)
		startA=start_dateA.split(" ")
		start1A=startA[0]
		start2A=start1A.split("-")
		dateA=start2A[0]
		heureA=start2A[1]
		minutesA=heureA.split(":")[1]
		heuresA=heureA.split(":")[0]
		minutesA.to_i+=heuresA.to_i*60
		minute_start_dateA=startA[2].to_i*60*60*24
		if [1,3,5,7,8,10,12].include?(start2A[1].to_i)
			minutes_start_dateA+=31(start2A[1].to_i)
		elsif [4,6,9,11].include?(start2A[1].to_i)
			minutes_start_dateA.to_i+=30*(start2A[1].to_i-1)
		elsif start2A[1].to_i==2
			minutes_start_dateA.to_i+=31
		end
		minutes_start_dateA.to_i+=30*30*24
		time2=minutesA+minutes_start_dateA	
		if time2>Time.now
			puts "apres"
		end
		#Time.now
	end
	def is_soon(start_date)
		start=start_date.split(" ")
		start=startA[0]
		start=start1A.split("-")
		date=start[0]
		heure=start[1]
		minutes=heure.split(":")[1]
		heures=heure.split(":")[0]
		minutes.to_i=heures.to_i*60
		minute_start_date=start[2].to_i*60*60*24
		if [1,3,5,7,8,10,12].include?(start[1].to_i)
			minutes_start_date+=31(start[1].to_i)
		elsif [4,6,9,11].include?(start[1].to_i)
			minutes_start_date.to_i+=30*(start[1].to_i-1)
		elsif start[1].to_i==2
			minutes_start_date.to_i+=31
		end
		minutes_start_date.to_i+=30*30*24
		time=minutes+minutes_start_date
		if time-Time.now > 30
			puts "soon"
		end
	end
	#def self.find_by_email(email)
		#tous=User.all
		#tous.each do |user_name|
			#if user_name.read_email == email
				#puts user_name
			#end
		#end

	#end
end
User.new("julie@julie.com")
User.new("jean@jean.com")

julie = User.find_by_email("julie@julie.com")
jean = User.find_by_email("jean@jean.com")

e = Event.new("2019-01-13 09:00", 10, "standup quotidien", [julie, jean])
puts "Voici l'email du premier attendee de l'événement : #{e.attendees.first.email}"
