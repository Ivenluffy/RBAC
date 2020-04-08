using CMS.IService;
using CMS.Model;
using CMS.WebApp.Areas.Admin.Controllers;
using System.Web.Mvc;

namespace CMS.WebApp.Areas.Blog.Controllers
{
    public class FeedbackController : BaseController
    {
        public IFeedbackService feedbackService { get; set; }
        // GET: Blog/Feedback
        public override ActionResult Index(int? Id)
        {
            base.Index(Id);
            return View();
        }
        [HttpGet]
        public JsonResult List(FeedbackModel filter, PageInfo pageInfo)
        {
            var result = feedbackService.GetListByFilter(filter, pageInfo);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Detail(int Id)
        {
            var model = feedbackService.GetDetail(Id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Delete(int Id)
        {
            var result = feedbackService.DeleteModel(Id) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
    }
}