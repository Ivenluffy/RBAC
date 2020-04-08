using CMS.Model;

namespace CMS.IRepository
{
    public interface ICommentRepository : IBaseRepository<CommentModel>
    {
        CommentModel GetDetail(int Id);
        int GetTodayCommentNum(string OpenId);
    }
}
