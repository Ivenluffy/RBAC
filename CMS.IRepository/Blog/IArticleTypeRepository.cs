using CMS.Model;
using System.Collections.Generic;

namespace CMS.IRepository
{
    public interface IArticleTypeRepository : IBaseRepository<ArticleTypeModel>
    {
        IEnumerable<ArticleTypeModel> GetArticleTypeList();
    }
}
