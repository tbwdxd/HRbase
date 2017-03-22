#import textract

def main():
	print ("Data processor made by Tong. Start.\n")
	#text = textract.process('test.pdf', method='pdfminer')
	text = "bowen tian \n 1234 abcd way, irvine, ca 900000\n Data Engineer"
	print (text)
	for line in text:
		for word in line.split(" "):
			print (word)

if __name__ == '__main__':
	main()
