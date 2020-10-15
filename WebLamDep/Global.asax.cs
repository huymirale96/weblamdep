using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace WebLamDep
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Session["login"] = false;
            Session["tenTK"] = "HUY";
            Session["maNguoiDung"] = "";
            Session["maGV"] = "";
            Session["quyen"] = "0";
            Session["type"] = "1";
            Session["mess"] = "1";
            Session["sessId"] = Session.SessionID;
            Session.Timeout = 100;
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}