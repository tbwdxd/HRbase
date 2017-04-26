using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CRUD_V2.Models;

namespace CRUD_V2.Controllers
{
    public class Employment_HistoryController : Controller
    {
        private HRbaseEntities db = new HRbaseEntities();

        // GET: Employment_History
        public ActionResult Index()
        {
            var employment_History = db.Employment_History.Include(e => e.Company).Include(e => e.User);
            return View(employment_History.ToList());
        }

        // GET: Employment_History/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employment_History employment_History = db.Employment_History.Find(id);
            if (employment_History == null)
            {
                return HttpNotFound();
            }
            return View(employment_History);
        }

        // GET: Employment_History/Create
        public ActionResult Create()
        {
            ViewBag.CompanyID = new SelectList(db.Companies, "CompanyID", "CompanyName");
            ViewBag.PersonID = new SelectList(db.Users, "PersonID", "EMail");
            return View();
        }

        // POST: Employment_History/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "EmploymentID,PersonID,CompanyID,WorkingField,Position,StartDate,EndDate,JobExp")] Employment_History employment_History)
        {
            if (ModelState.IsValid)
            {
                db.Employment_History.Add(employment_History);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CompanyID = new SelectList(db.Companies, "CompanyID", "CompanyName", employment_History.CompanyID);
            ViewBag.PersonID = new SelectList(db.Users, "PersonID", "EMail", employment_History.PersonID);
            return View(employment_History);
        }

        // GET: Employment_History/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employment_History employment_History = db.Employment_History.Find(id);
            if (employment_History == null)
            {
                return HttpNotFound();
            }
            ViewBag.CompanyID = new SelectList(db.Companies, "CompanyID", "CompanyName", employment_History.CompanyID);
            ViewBag.PersonID = new SelectList(db.Users, "PersonID", "EMail", employment_History.PersonID);
            return View(employment_History);
        }

        // POST: Employment_History/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "EmploymentID,PersonID,CompanyID,WorkingField,Position,StartDate,EndDate,JobExp")] Employment_History employment_History)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employment_History).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CompanyID = new SelectList(db.Companies, "CompanyID", "CompanyName", employment_History.CompanyID);
            ViewBag.PersonID = new SelectList(db.Users, "PersonID", "EMail", employment_History.PersonID);
            return View(employment_History);
        }

        // GET: Employment_History/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employment_History employment_History = db.Employment_History.Find(id);
            if (employment_History == null)
            {
                return HttpNotFound();
            }
            return View(employment_History);
        }

        // POST: Employment_History/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Employment_History employment_History = db.Employment_History.Find(id);
            db.Employment_History.Remove(employment_History);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
