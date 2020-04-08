using CMS.IService;
using CMS.Model;
using CMS.WebApp.Models;
using System.Collections.Generic;
using System.Web.Mvc;

namespace CMS.WebApp.Controllers
{
    public class LinksController : Controller
    {
        public ILinksService service { get; set; }
        // GET: Links
        public ActionResult Index()
        {
            WebSiteInfo siteInfo = new WebSiteInfo();
            ViewBag.SiteTitle = siteInfo.GetWebSiteInfo().SiteTitle;
            IEnumerable<LinksModel> LinksList = service.GetAll();
            return View(LinksList);
        }
    }
}