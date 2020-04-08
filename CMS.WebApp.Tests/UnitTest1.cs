using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace CMS.WebApp.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
        }
        public void GetRndCode()
        {
            int length = 4;
            System.Collections.Generic.List<string> list = new System.Collections.Generic.List<string>();
            for (var i = 65; i < 91; i++)
            {
                list.Add(((char)i).ToString().ToLower());
                list.Add(((char)i).ToString());
            }
            for (var i = 0; i < 10; i++)
            {
                list.Add(i.ToString());
            }
            Random rnd = new Random();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            for (var i = 0; i < length; i++)
            {
                int n = rnd.Next(list.Count);
                sb.Append(list[n]);
                list.RemoveAt(n);
            }
            sb.ToString();
        }
    }
}
