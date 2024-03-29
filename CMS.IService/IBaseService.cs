﻿using CMS.Model;
using System.Collections.Generic;

namespace CMS.IService
{
    public interface IBaseService<T> where T:class ,new ()
    {
        #region CRUD
        bool CreateModel(T model);
        T ReadModel(int Id);
        bool UpdateModel(T model);
        bool UpdateModel(T model, string updateFields);
        bool DeleteModel(int Id);
        bool DeleteByWhere(string where);
        #endregion
        IEnumerable<T> GetAll(string returnFields = null, string orderby = null);
        dynamic GetListByFilter(T filter, PageInfo pageInfo);
        IEnumerable<T> GetByWhere(string where = null, object param = null, string returnFields = null, string orderby = null);
        IEnumerable<T> GetBySkip(int skip, int take, string returnFields = null, string where = null, object param = null, string orderBy = null);
    }
}
