using CMS.Model;
using System.Collections.Generic;

namespace CMS.IService
{
    public interface IDiarysService : IBaseService<DiarysModel>
    {
        IEnumerable<DiarysModel> GetYear();
    }
}
