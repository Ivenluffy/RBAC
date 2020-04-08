using CMS.IRepository;
using CMS.IService;
using CMS.Model;
using System.Collections.Generic;

namespace CMS.Service
{
    public class ArticleTypeService : BaseService<ArticleTypeModel>, IArticleTypeService
    {
        public IArticleTypeRepository repository { get; set; }
        public dynamic GetListByFilter(ArticleTypeModel filter, PageInfo pageInfo)
        {
            return GetListByFilter(filter, pageInfo, null);
        }
        public IEnumerable<ArticleTypeModel> GetArticleTypeList()
        {
            return repository.GetArticleTypeList();
        }
    }
}
