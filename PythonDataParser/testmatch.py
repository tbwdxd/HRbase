import re
def main():
	dict = ["girl","boy"]
	testcase = "I am a girl."
	testcase1 = re.findall(r"[\w']+", testcase) #r stands for regular expression
	print (testcase1)


#	for word in testcase1:
#		for word2 in dict:
#			if word == word2:
#				print ("found")
if __name__ == '__main__':
	main()
