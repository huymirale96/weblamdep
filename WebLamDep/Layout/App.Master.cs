﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebLamDep.Layout
{
    public partial class App : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( String.Compare(Session["quyen"].ToString(),"") == 0 )
            {
                Response.Redirect("Login.aspx");
            }
        }

        
    }
}