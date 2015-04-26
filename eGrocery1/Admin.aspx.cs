using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eGrocery1
{
    public partial class Admin : System.Web.UI.Page
    {
        private void BindUpdatedData()
        {
            SampleDataContext sd = new SampleDataContext();
            var data = from p in sd.Product1s
                       select p;
            rptr_delete.DataSource = data;
            rptr_delete.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            div_InsertTab.Visible = true;
            btn_InsertItem1.Style.Add("background","#00ffff");
            div_DeleteTab.Visible = false;
            div_EnterCriteria.Visible = false;
            div_DisplayData.Visible = false;
            BindUpdatedData();


            btn_DisplayItem1.Style.Remove("background");
            btn_DeleteItem1.Style.Remove("background");
            
        }

        protected void btn_InsertItem_OnClick(object sender, EventArgs e)
        {
            div_InsertTab.Visible = true;
            btn_InsertItem1.Style.Add("background", "#00ffff");
            div_DeleteTab.Visible = false;
            div_EnterCriteria.Visible = false;
            div_DisplayData.Visible = false;


            btn_DeleteItem1.Style.Remove("background");
            btn_DisplayItem1.Style.Remove("background");
        }
        protected void btn_DeleteItem_OnClick(object sender, EventArgs e)
        {
            div_InsertTab.Visible = false;
            div_DeleteTab.Visible = true;
            btn_DeleteItem1.Style.Add("background", "#00ffff");
            div_EnterCriteria.Visible = false;
            div_DisplayData.Visible = false;

            btn_InsertItem1.Style.Remove("background");
            btn_DisplayItem1.Style.Remove("background");
        }

        protected void btn_DivDisplay_OnClick(object sender, EventArgs e)
        {
            div_InsertTab.Visible = false;
            div_DeleteTab.Visible = false;
            div_EnterCriteria.Visible = true;
            btn_DisplayItem1.Style.Add("background", "#00ffff");
            div_DisplayData.Visible = false;

            btn_InsertItem1.Style.Remove("background");
            btn_DeleteItem1.Style.Remove("background");
        }

        protected void btn_Insert_OnClick(object sender, EventArgs e)
        {
            
            SampleDataContext sd1 = new SampleDataContext();

            int nextProdId = (from p1 in sd1.Product1s
                              select p1.ProductId).Max();

            Product1 pd = new Product1();
            pd.Descr = txt_desc.Text;
            pd.SKU = txt_sku.Text;
            pd.Brand = txt_brand.Text;
           
           pd.QtyRecieved = Convert.ToInt32(txt_QtyReceived.Text);
           pd.QtyRem = Convert.ToInt32(txt_qtyRemaining.Text);

           pd.DateReceived = Convert.ToDateTime(txt_dateReceived.Value);


           using (SampleDataContext sd = new SampleDataContext())
           {
               sd.Product1s.InsertOnSubmit(pd);
               sd.SubmitChanges();
               grd_ins.DataSource = sd.Product1s;
               grd_ins.DataBind();
               BindUpdatedData();
           }
            
        }
        protected void btn_Delete_OnClick(object sender, EventArgs e)
        {
            
            
            LinkButton btnDelete = (LinkButton)sender;
            RepeaterItem rptrDelete = (RepeaterItem)btnDelete.NamingContainer;
            Label selectedLabel = (Label)rptrDelete.FindControl("lbl_prodId");
            int productId = Convert.ToInt32(selectedLabel.Text);

            using(SampleDataContext sd = new SampleDataContext())
            {
                Product1 prodToDelete = sd.Product1s.SingleOrDefault(x => x.ProductId == productId);
                sd.Product1s.DeleteOnSubmit(prodToDelete);
                sd.SubmitChanges();
                BindUpdatedData();
            }
            
        }

        protected void btn_Display_OnClick(object sender, EventArgs e)
        {
            div_InsertTab.Visible = false;
            div_DeleteTab.Visible = false;
            div_EnterCriteria.Visible = false;
            div_DisplayData.Visible = true;

            SampleDataContext ctxt = new SampleDataContext();
            DateTime dt = Convert.ToDateTime(txt_EnterCritDate.Value);

            grd_DisplayData.DataSource = from it in ctxt.Product1s
                                         where it.Brand == txt_EnterCritBrand.Text ||
                                               it.DateReceived == dt ||
                                               it.Descr == txt_EnterCritProdDesc.Text
                                         select it;
            grd_DisplayData.DataBind();
        }

        protected void btn_Select_OnClick(object sender, EventArgs e)
        {
            div_InsertTab.Visible = false;
            div_DeleteTab.Visible = false;
            div_EnterCriteria.Visible = true;
            div_DisplayData.Visible = false;
        }

        protected void btn_logout_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}