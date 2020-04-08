using CMS.Model;
using System.Collections.Generic;

namespace CMS.IRepository
{
    public interface IArticleClassRepository : IBaseRepository<ArticleClassModel>
    {
        IEnumerable<ArticleClassModel> GetArticleClassList();
        bool DeleteClassAllByClassId(int classId);
    }
}
