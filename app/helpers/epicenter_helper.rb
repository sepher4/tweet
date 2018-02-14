module EpicenterHelper


	def trending
		array = TweetTag.pluck(:tag_id)

	    hash = array.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }

	    results = hash.sort_by{ |k,v| v}.reverse
	    
	    @topPhrase = Tag.find(results[0][0]).phrase
	    @secondPhrase = Tag.find(results[1][0]).phrase
	    @thirdPhrase = Tag.find(results[2][0]).phrase
	end

end
