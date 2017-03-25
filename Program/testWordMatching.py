import textract
import re
def main():

#split the original resume by space
	text = textract.process('testDoc.doc')
	finaltext = text.decode('UTF-8')
	splitext = re.findall(r"[\w']+", finaltext)	#split is a list
	dict_ = ["software engineer","Java","Electrical Engineering","HTML","System Engineer","Mechanical Engineering","Python","DOORS","team player","Chemistry","Tomatoes","League of Legends"]
	#dict_ = ["Tong","Software Engineer"]
	#count store the matching words and their matching times
	result = {}									#result is a dictionary
		#calculate number of matching word in the original text
		#do nothing
	index_i = -1
	for element in splitext:
		index_i += 1
		compare(element, dict_, splitext,index_i,result)
			#update result[keyword]
	print('Matched keywords are as follows: ')
	for key in result:
		print ("Word: ",key, " Count: ",result[key])

def compare(element, dict_, splitext,index_i,result):             #check if element is 'in' dict
	for keyword in dict_:
		newkeyword = keyword.split()
		if(len(newkeyword) > 1):               					  #if current keyword is more than one word
			if element == newkeyword[0]:
				tempindex = index_i
				is_match = True
				for i in range(1, len(newkeyword)):
					tempindex += 1
					if (splitext[tempindex] != newkeyword[i]):
						is_match = False
						break
				if is_match == True:
					if keyword not in result:
						result[keyword] = 1
					else:
						result[keyword] += 1
		else:
			if newkeyword[0] == element:
				if newkeyword[0] not in result:
					result[newkeyword[0]] = 1
				else:
					result[newkeyword[0]] += 1
	#see if match, handle cap or non cap

"""
def matchingTime(splitext, dict, count):        #
	countime = -1 
	matchingtime = 0
	for element in splitext:
		count += 1
		for keyword in dict:
			match = True
			if(len(keyword) > 1):               #if current keyword is more than one word
				keyword = keyword.split()
				if element == keyword[0]:
					tempindex = countime
					for i in (0, len(keyword)):
						tempindex += 1
						if (splitext[tempindex] != keyword):
							match = False
							break
							matchingtime += 1
					if matchingtime == len(keyword):
						if keyword not in count:
							count[keyword] = 1
						else:
							count[keyword] += 1
				else: 
					match = False
			else:								#if current keyword is single word
				if keyword != element:
					match = False
				else:
"""					
	

if __name__ == '__main__':
	main()