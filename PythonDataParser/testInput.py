import textract

def main():
	print ("Data processor made by Tong. Start.\n")
	text = textract.process('testDoc.doc')
	finaltext = text.decode('UTF-8')
#	text2 = textract.process('testDocx.docx')
#	text3 = textract.process('test.pdf')
#	text = "bowen tian \n 1234 abcd way, irvine, ca 900000\n Data Engineer"
#	print('Here is the result of doc to text')
	print(finaltext)
#	print('Here is the result of docx to text')
#	print(text2)
#	print('Here is the result of pdf to text')
#	print(text3)
#	for line in text:
		#for word in line.split(" "):
#		print (line)

if __name__ == '__main__':
	main()
