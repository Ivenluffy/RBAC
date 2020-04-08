using CMS.Model;

namespace CMS.IService
{
    public interface ICommentService : IBaseService<CommentModel>
    {
        CommentModel GetDetail(int Id);
        int GetTodayCommentNum(string OpenId);
    }
}
