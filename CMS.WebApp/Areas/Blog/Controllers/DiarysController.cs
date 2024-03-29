﻿using CMS.IService;
using CMS.Model;
using CMS.WebApp.Areas.Admin.Controllers;
using System;
using System.Web.Mvc;

namespace CMS.WebApp.Areas.Blog.Controllers
{
    public class DiarysController : BaseController
    {
        public IDiarysService diarysService { get; set; }
        // GET: Blog/Diarys
        public override ActionResult Index(int? Id)
        {
            base.Index(Id);
            return View();
        }
        [HttpGet]
        public JsonResult List(DiarysModel filter, PageInfo pageInfo)
        {
            var result = diarysService.GetListByFilter(filter, pageInfo);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Add(DiarysModel model)
        {
            model.CreateOn = DateTime.Now;
            var result = diarysService.CreateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        public ActionResult Detail(int Id)
        {
            var model = diarysService.ReadModel(Id);
            return View(model);
        }
        public ActionResult Edit(int Id)
        {
            var model = diarysService.ReadModel(Id);
            return View(model);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(DiarysModel model)
        {
            var result = diarysService.UpdateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        [HttpPost]
        public ActionResult Delete(int Id)
        {
            var result = diarysService.DeleteModel(Id) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
    }
}