﻿using Dapper;
using CMS.IRepository;
using CMS.Model;
using System.Collections.Generic;

namespace CMS.Repository
{
    public class DiarysRepository : BaseRepository<DiarysModel>, IDiarysRepository
    {
        public IEnumerable<DiarysModel> GetYear()
        {
            using (var conn = MySqlHelper.GetConnection())
            {
                var sql = @"SELECT date_format(CreateOn,'%Y') as Year FROM t_diarys
                            GROUP BY date_format(CreateOn,'%Y')
                            ORDER BY date_format(CreateOn,'%Y') desc";
                return conn.Query<DiarysModel>(sql);
            }
        }
    }
}
