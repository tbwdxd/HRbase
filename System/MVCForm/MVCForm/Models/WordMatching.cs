using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;

namespace MVCForm.Models
{
    public class WordMatching
    {
        private textParser parser = new textParser();
        private JSON Dict;
        private string Doc;
        public void matching(string[] args)
        {
            args[0] = "C:\\Users\\COMACIT\\Desktop\\HRbase\\PythonDataParser";
            //args[1] = "";
            String text = parser.ExtractTextFromPdf(args[0]);

        }

    }

    
    
}