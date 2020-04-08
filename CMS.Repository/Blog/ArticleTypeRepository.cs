using Dapper;
using CMS.IRepository;
using CMS.Model;
using System.Collections.Generic;

namespace CMS.Repository
{
    public class ArticleTypeRepository : BaseRepository<ArticleTypeModel>, IArticleTypeRepository
    {
        public IEnumerable<ArticleTypeModel> GetArticleTypeList()
        {
            using (var conn = MySqlHelper.GetConnection())
            {
                var sql = "SELECT Id,Name from t_article_type";
                return conn.Query<ArticleTypeModel>(sql);
            }
        }
    }
}
