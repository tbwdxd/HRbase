import textract
import re
def main():
	#calculate number of matching word in the original text

	#split the original resume by space
	text = textract.process('testDoc.doc')
	finaltext = text.decode('UTF-8')
	splitext = re.findall(r"[\w']+", finaltext)	#split is a list
	dict_ = ["SoFtWARE EnGineer","Java","Electrical Engineering","HTML","System Engineer","Mechanical Engineering","Python","DOORS","team player","Chemistry","Tomatoes","League of Legends"]
#	dict_ = ["SoFtWARE EnGineer"]								   #we'd better search the keyword one by one
	result = {}													   #result is a dictionary

	index_i = -1
	for element in splitext:
		index_i += 1
		element = element.lower()								  #converse the word to all lower case in order to handle case insentitive
		compare(element, dict_, splitext,index_i,result)
	print('Matched keywords are as follows: ')
	for key in result:
		print ("Word: ",key, " Count: ",result[key])



def compare(element, dict_, splitext, index_i, result):           #check if element is 'in' dict
	for keyword in dict_:
		keyword = keyword.lower()								  #converse the word to all lower case in order to handle case insentitive
		newkeyword = keyword.split()
		if(len(newkeyword) > 1):               					  #if current keyword is more than one word
			if element == newkeyword[0]:						  #if the first word of the key word matched
				tempindex = index_i
				is_match = True
				for i in range(1, len(newkeyword)):				  #continue match the rest of the keyword
					tempindex += 1
					if (splitext[tempindex] != newkeyword[i]):    #if the one of the word in the key word doesn't match
						is_match = False
						break
				if is_match == True:    						  #if the keyowrd totally matched, add the matching keyword in the result dictionary
					if keyword not in result:
						result[keyword] = 1
					else:
						result[keyword] += 1
		else:													 #if current keyword is a single word
			if newkeyword[0] == element:
				if newkeyword[0] not in result:
					result[newkeyword[0]] = 1
				else:
					result[newkeyword[0]] += 1

if __name__ == '__main__':
	main()