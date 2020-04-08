using CMS.Model;

namespace CMS.IRepository
{
    public interface IFeedbackRepository : IBaseRepository<FeedbackModel>
    {
        FeedbackModel GetDetail(int Id);
        int GetTodayFeedbackNum(string OpenId);
    }
}
