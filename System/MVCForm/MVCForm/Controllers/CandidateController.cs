using MVCForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCForm.Controllers
{
    public class CandidateController : Controller  //This controller is specified for candidate page use only.
    {
        private CandidateModels test_model = new CandidateModels(); //construct a candidate Model object for this controller to use.
        public ActionResult Details() //print a test candidate result on /Candidate/Details page.
        {
            Candidate test_candidate = test_model.get_canditate(); //construct a test_candidate object and get a test candidate from Model object.
            return View(test_candidate); //throw test_candidate data to View.
        }
    }
    public class SearchController : Controller  //
    {

    }
}