using CMS.Model;
using System.Collections.Generic;

namespace CMS.IRepository
{
    public interface IArticleRepository : IBaseRepository<ArticleModel>
    {
        ArticleModel GetDetail(int Id);
        IEnumerable<ArticleModel> GetYear();
    }
}
