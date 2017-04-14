using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCForm.Models
{
    public class Candidate //define a class to hold candidate information
    {
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public int Age { get; set; }
        public string LivingArea { get; set; }
        public string Major { get; set; }
        public string CellPhone { get; set; }

    }

    public class CandidateModels { //define a class for candidate functions
        public Candidate get_canditate() // test function for constructing a test candidate by hard coding
        {
            Candidate candidate = new Candidate() // hard coding candidate
            {
                LastName = "Ma",
                FirstName = "Haoran",
                Age = 25,
                LivingArea = "Irvine",
                Major = "EE",
                CellPhone = "123456789"
            };
            return candidate; // return the hard code candidate
        }
    }
}