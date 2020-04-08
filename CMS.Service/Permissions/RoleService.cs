using CMS.IRepository;
using CMS.IService;
using CMS.Model;
using System.Collections.Generic;

namespace CMS.Service
{
    public class RoleService : BaseService<RoleModel>, IRoleService
    {
        public IRoleRepository repository { get; set; }
        public IEnumerable<RoleModel> GetRoleList()
        {
            return repository.GetRoleList();
        }
        public dynamic GetListByFilter(RoleModel filter, PageInfo pageInfo)
        {
            string _where = " where 1=1";
            if (!string.IsNullOrEmpty(filter.RoleName))
            {
                _where += " and RoleName=@RoleName";
            }
            if (filter.Status != null)
            {
                _where += " and Status=@Status";
            }
            return GetListByFilter(filter, pageInfo, _where);
        }

        public bool DeleteRoleAllByRoleId(int roleId)
        {
            return repository.DeleteRoleAllByRoleId(roleId);
        }
    }
}
