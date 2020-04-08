using CMS.IService;
using CMS.Model;
using CMS.WebApp.Areas.Admin.Controllers;
using System.Web.Mvc;

namespace CMS.WebApp.Areas.Blog.Controllers
{
    public class CommentController : BaseController
    {
        public ICommentService commentService { get; set; }
        // GET: Blog/Comment
        public override ActionResult Index(int? Id)
        {
            base.Index(Id);
            return View();
        }
        [HttpGet]
        public JsonResult List(CommentModel filter, PageInfo pageInfo)
        {
            var result = commentService.GetListByFilter(filter, pageInfo);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Detail(int Id)
        {
            var model = commentService.GetDetail(Id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Delete(int Id)
        {
            var result = commentService.DeleteModel(Id) ? SuccessTip() : ErrorTip();
            return Json(result);
        }

    }
}