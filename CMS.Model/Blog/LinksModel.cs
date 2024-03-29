﻿using DapperExtensions;
using System;
using System.ComponentModel.DataAnnotations;

namespace CMS.Model
{
    [Table("t_links")]
    public class LinksModel
    {
        [DapperExtensions.Key(true)]
        /// <summary>
        /// ID
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 网站名称
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 网址
        /// </summary>
        public string Url { get; set; }
        /// <summary>
        /// 图标
        /// </summary>
        public string Icon { get; set; }
        /// <summary>
        /// 描述
        /// </summary>
        public string Describe { get; set; }
        /// <summary>
        /// 创建日期
        /// </summary>
        [Display(Name = "创建日期")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd HH:mm:ss}")]
        public DateTime CreateOn { get; set; }
    }
}
