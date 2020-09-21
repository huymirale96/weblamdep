using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebLamDep.Model;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace WebLamDep.View
{
    public partial class ThemTaiKhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            nam.Checked = true;
            admin.Checked = true;
        }

        ConnectDatabase conn = new ConnectDatabase();

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection sqlConnection = conn.connectDatabase())
                {
                    SqlCommand sqlCommand = new SqlCommand("sp_themtk", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@user", txtTenDangNhap.Text );
                    sqlCommand.Parameters.AddWithValue("@pass", txtMK.Text);
                    sqlCommand.Parameters.AddWithValue("@ten", txtTen.Text);
                    sqlCommand.Parameters.AddWithValue("@dt", sdtGV.Text);
                    sqlCommand.Parameters.AddWithValue("@mail",emailGV.Text);
                   if(nam.Checked == true)
                    {
                        sqlCommand.Parameters.AddWithValue("@gt", "1");
                    }
                   else
                    {
                        sqlCommand.Parameters.AddWithValue("@gt", "0");
                    }

                    if (member.Checked == true)
                    {
                        sqlCommand.Parameters.AddWithValue("@maquyen", "1");
                    }
                    else
                    {
                        sqlCommand.Parameters.AddWithValue("@maquyen", "2");
                    }

                    int i = sqlCommand.ExecuteNonQuery();
                   if(i > 0)
                    {
                        lblDaDuyet.Text = "Tạo Tài Khoản Thành Công";
                   //     lblDaDuyet.CssClass = "text-success";
                    }
                }
            }
            catch (Exception exx)
            {
                Debug.WriteLine("nhan dc loi  " + exx.Message);
            }
        }
    }
}