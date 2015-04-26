using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eGrocery1
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                div_EnterCriteria.Visible = true;
                div_DisplayData.Visible = false;
            }
        }

        protected void btn_Select_OnClick(object sender, EventArgs e)
        {
            SampleDataContext ctxt = new SampleDataContext();
            div_EnterCriteria.Visible = true;
            div_DisplayData.Visible = false;
        }

        protected void btn_Display_OnClick(object sender, EventArgs e)
        {
            div_EnterCriteria.Visible = false;
            div_DisplayData.Visible = true;
            SampleDataContext ctxt = new SampleDataContext();
            DateTime dt = Convert.ToDateTime(txt_DateReceived1.Value);

            grd_DisplayData.DataSource = from p in ctxt.Product1s 
                                            where(p.Brand == txt_Brand.Text ||
                                                p.DateReceived == dt ||
                                                p.Descr == txt_ProdDesc.Text)
                                            select new{ 
                                                 Product_id = p.ProductId,
                                                 Description = p.Descr, 
                                                 Product_SKU = p.SKU, 
                                                 Received_Date = p.DateReceived.Value.ToShortDateString(), 
                                                 Quantity_rem = p.QtyRem
                                            };
            grd_DisplayData.DataBind();

        }

        protected void btn_logout_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}