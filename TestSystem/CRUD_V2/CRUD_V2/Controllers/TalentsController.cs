﻿using System;
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
    public class TalentsController : Controller
    {
        private HRbaseEntities db = new HRbaseEntities();

        // GET: Talents
        public ActionResult Index()
        {
            var talents = db.Talents.Include(t => t.User);
            return View(talents.ToList());
        }

        // GET: Talents/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Talent talent = db.Talents.Find(id);
            if (talent == null)
            {
                return HttpNotFound();
            }
            return View(talent);
        }

        // GET: Talents/Create
        public ActionResult Create()
        {
            ViewBag.PersonID = new SelectList(db.Users, "PersonID", "EMail");
            return View();
        }

        // POST: Talents/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TalentID,PersonID,LastName,FirstName,Age,LivingArea,CellPhone,DirectPhone,Major,HighestDegree,GraduteSchool,Citizen,SubmissionDate,Source,LinkedIn,ResumeLocation,KeyWord")] Talent talent)
        {
            if (ModelState.IsValid)
            {
                db.Talents.Add(talent);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PersonID = new SelectList(db.Users, "PersonID", "EMail", talent.PersonID);
            return View(talent);
        }

        // GET: Talents/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Talent talent = db.Talents.Find(id);
            if (talent == null)
            {
                return HttpNotFound();
            }
            ViewBag.PersonID = new SelectList(db.Users, "PersonID", "EMail", talent.PersonID);
            return View(talent);
        }

        // POST: Talents/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TalentID,PersonID,LastName,FirstName,Age,LivingArea,CellPhone,DirectPhone,Major,HighestDegree,GraduteSchool,Citizen,SubmissionDate,Source,LinkedIn,ResumeLocation,KeyWord")] Talent talent)
        {
            if (ModelState.IsValid)
            {
                db.Entry(talent).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PersonID = new SelectList(db.Users, "PersonID", "EMail", talent.PersonID);
            return View(talent);
        }

        // GET: Talents/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Talent talent = db.Talents.Find(id);
            if (talent == null)
            {
                return HttpNotFound();
            }
            return View(talent);
        }

        // POST: Talents/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Talent talent = db.Talents.Find(id);
            db.Talents.Remove(talent);
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

        public ActionResult Upload(HttpPostedFileBase file)
        {
            if (file != null & file.ContentLength > 0)
            {
                string path = Server.MapPath("~/Resumes/" + file.FileName); //setting location
                file.SaveAs(path); //saving file
                ViewBag.Path = path;
            }
            else
            {
                ViewBag.Message = "You have not specified a file";
            }
           
            return View();
        }
    }
}
