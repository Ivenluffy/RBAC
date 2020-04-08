using CMS.WebApp.Models;
using System.Web.Mvc;

namespace CMS.WebApp.Controllers
{
    public class AboutController : Controller
    {
        // GET: About
        public ActionResult Index()
        {
            WebSiteInfo siteInfo = new WebSiteInfo();
            ViewBag.SiteTitle = siteInfo.GetWebSiteInfo().SiteTitle;
            return View();
        }
    }
}