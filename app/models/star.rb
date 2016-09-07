class Star < ActiveRecord::Base

	def Star.populate
		dat = File.new("hygdata_v3.csv", 'r')
		dat.gets
		while line = dat.gets
			line = line.split(",")
			if line[9].to_f<15.0
				hip = line[1]
				gl = line[4]
				bf = line[5]
				proper = line[6]
				dist = line[9]
				mag = line[14]
				spect = line[15]
				if line[16].empty?
					color = 0
				else
					color = line[16]
				end
				x = line[17]
				y = line[18]
				z = line[19]
				name=""
				if proper!=""
					name = proper
				elsif bf!=""
					name = bf
				elsif gl!=""
					name = gl
				else
					name = hip
				end
				@star = Star.new(:name => name, :x => x, :y => y, :z => z, :mag => mag, :spect => spect, :color => color)
				@star.save
			end
		end
	end

	def Star.distance(star1, star2)
  		return Math.sqrt((star2.x-star1.x)**2+(star2.y-star1.y)**2+(star2.z-star1.z)**2)
  	end

  	def starsWithin(dist)
  		return_arr = []
  		stars = Star.all
  		for star in stars do
  			if Star.distance(self, star)<=dist
  				if star.id != self.id
  					return_arr.push(star)
  				end
  			end
  		end
  		return return_arr
  	end

  	def Star.distanceSort(home, stars)
  		distanceArr = []
  		i=0
  		for star in stars do
  			distanceArr[i]=[star.id,Star.distance(home,star)]
  			i+=1
  		end
  		distanceArr = distanceArr.sort {|a,b| a[1] <=> b[1]}
  		returnArr = []
  		for star in distanceArr
  			returnArr.push(Star.find(star[0]))
  		end
  		return returnArr
  	end

  	def test
  		puts "testing"
  	end
end
