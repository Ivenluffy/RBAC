using CMS.IRepository;
using CMS.IService;
using CMS.Model;
using System.Collections.Generic;

namespace CMS.Service
{
    public class ArticleClassService : BaseService<ArticleClassModel>, IArticleClassService
    {
        public IArticleClassRepository repository { get; set; }
        public dynamic GetListByFilter(ArticleClassModel filter, PageInfo pageInfo)
        {
            return GetListByFilter(filter, pageInfo, null);
        }

        public IEnumerable<ArticleClassModel> GetArticleClassList()
        {
            return repository.GetArticleClassList();
        }

        public bool DeleteClassAllByClassId(int classId)
        {
            return repository.DeleteClassAllByClassId(classId);
        }
    }
}
