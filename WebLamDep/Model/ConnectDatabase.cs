using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebLamDep.Model
{
    public class ConnectDatabase
    {
        public string strCon = @"Data Source=DESKTOP-C1VSI5K\SQLEXPRESS;Initial Catalog=webTinTuc1;Integrated Security=True";
        public SqlConnection connectDatabase()
        {
            SqlConnection myCnn = new SqlConnection(strCon);
            myCnn.Open();
            return myCnn;
        }
    }
}