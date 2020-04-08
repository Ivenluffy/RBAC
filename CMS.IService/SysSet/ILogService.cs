using CMS.Model;

namespace CMS.IService
{
    public interface ILogService:IBaseService<LogModel>
    {
        bool WriteDbLog(LogModel model);
    }
}
