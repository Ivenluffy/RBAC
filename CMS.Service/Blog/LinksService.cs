using CMS.IService;
using CMS.Model;

namespace CMS.Service
{
    public class LinksService : BaseService<LinksModel>, ILinksService
    {
        public dynamic GetListByFilter(LinksModel filter, PageInfo pageInfo)
        {
            return GetListByFilter(filter, pageInfo, null);
        }
    }
}
