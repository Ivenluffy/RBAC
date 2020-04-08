using CMS.Model;
using System.Collections.Generic;

namespace CMS.IRepository
{
    public interface IDiarysRepository : IBaseRepository<DiarysModel>
    {
        IEnumerable<DiarysModel> GetYear();
    }
}
