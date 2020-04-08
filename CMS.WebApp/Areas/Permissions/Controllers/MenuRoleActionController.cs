using CMS.IService;
using CMS.Model;
using CMS.WebApp.Areas.Admin.Controllers;
using System.Collections.Generic;
using System.Web.Mvc;

namespace CMS.WebApp.Areas.Permissions.Controllers
{
    public class MenuRoleActionController : BaseController
    {
        private readonly IMenuRoleActionService service;
        public MenuRoleActionController(IMenuRoleActionService _service)
        {
            service = _service;
        }
        [HttpPost]
        public ActionResult InsertBatch(IEnumerable<MenuRoleActionModel> list, int roleId)
        {
            var result = service.SavePermission(list, roleId) > 0 ? SuccessTip() : ErrorTip();
            return Json(result);
        }
    }
}