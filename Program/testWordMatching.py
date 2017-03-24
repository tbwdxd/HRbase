import textract
import re
def main():

#split the original resume by space
	text = textract.process('testDoc.doc')
	finaltext = text.decode('UTF-8')
	split = re.findall(r"[\w']+", finaltext)
	dict = ["software engineer","Java","Electrical Engineering","HTML","System Engineer","Mechanical Engineering","Python","DOORS","team player","Chemistry","Tomatoes","League of Legends"]
#count store the matching words and their matching times
	count = {}#count is a dictionary
	counttime = 0
	for word in split:
		for keyword in dict:
			tempkeyword = keyword.split() #tempkeyword is a list
			#if the keyword is a phase
			if (len(tempkeyword) > 1):
				#see if index[0]
				#see if index[1]
				#...
				#see if index[n]
				for index in (0, len(tempkeyword) - 1):
					if tempkeyword[index] == word:
						counttime += 1
						print (tempkeyword[index]," >>>>>>>> ", word)
						if keyword not in count:
							count[keyword] = 1
					
					else: 
						 continue

					count[keyword] += 1
			#if the keyword is a single word
			else:
				if word == keyword:
					if keyword not in count:
						count[keyword] = 1
					else:
						count[keyword]+=1

	print('Matched keywords are as follows: ')
	print (count)
	for key in count:
		print ("Word: ",key, " Count: ",count[key])

#def match():
	#see if match, handle cap or non cap

if __name__ == '__main__':
	main()