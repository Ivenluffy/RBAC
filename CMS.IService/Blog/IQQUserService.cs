using CMS.Model;

namespace CMS.IService
{
    public interface IQQUserService : IBaseService<QQUserModel>
    {
        QQUserModel GetQQUserByOpenId(string OpenId);
        bool UpdateQQUser(QQUserModel model);
    }
}
