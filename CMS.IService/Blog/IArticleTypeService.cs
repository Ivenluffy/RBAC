using CMS.Model;
using System.Collections.Generic;

namespace CMS.IService
{
    public interface IArticleTypeService : IBaseService<ArticleTypeModel>
    {
        IEnumerable<ArticleTypeModel> GetArticleTypeList();
    }
}
