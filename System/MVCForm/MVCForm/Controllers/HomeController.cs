using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCForm.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //call Model to take employee data
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
    public class ViewController : Controller //This controller is for view resume when pressing the button
    {

        //data databasedata; //this is for database return data
        //printtableview();//this is for create a data base query 
    }

    public class DownloadController : Controller //This controller is for download resume when pressing the button
    {

    }

}