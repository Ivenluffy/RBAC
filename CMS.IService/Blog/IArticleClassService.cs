using CMS.Model;
using System.Collections.Generic;

namespace CMS.IService
{
    public interface IArticleClassService : IBaseService<ArticleClassModel>
    {
        IEnumerable<ArticleClassModel> GetArticleClassList();
        /// <summary>
        /// 删除分类和分类下的文章
        /// </summary>
        /// <param name="classId"></param>
        /// <returns></returns>
        bool DeleteClassAllByClassId(int classId);
    }
}
