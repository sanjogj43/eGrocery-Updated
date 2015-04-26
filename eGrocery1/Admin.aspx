<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="eGrocery1.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" id="div_SelectAction">
        <h2>You can perform following actions</h2>
        <asp:LinkButton ID="btn_InsertItem1" runat="server" Text="Insert" Style="margin-left: 40px; width: 100px" OnClick="btn_InsertItem_OnClick"/>
        <asp:LinkButton ID="btn_DeleteItem1" runat="server" Text="Delete" Style="margin-left: 40px; width: 100px" OnClick="btn_DeleteItem_OnClick"/>
        <asp:LinkButton ID="btn_DisplayItem1" runat="server" Text="View" Style="margin-left: 40px; width: 100px" OnClick="btn_DivDisplay_OnClick"/><br/>
        <hr/>
        <br />
    </div>
    <div runat="server" id="div_InsertTab">
        <label style="display: inline-block; width: 130px">Description  :  </label>
        <asp:TextBox runat="server" ID="txt_desc" />
        <asp:RequiredFieldValidator ControlToValidate="txt_desc" runat="server" ToolTip="Required field" 
            ErrorMessage="Required field" Display="Dynamic" ForeColor="Red" ValidationGroup="val_insertTab"/>
        <br />

        <label style="display: inline-block; width: 130px">SKU  :  </label>
        <asp:TextBox runat="server" ID="txt_sku" />
        <asp:RequiredFieldValidator ControlToValidate="txt_sku" runat="server" ToolTip="Required field" 
            ErrorMessage="Required field" Display="Dynamic" ForeColor="Red" ValidationGroup="val_insertTab"/>
        <br />

        <label style="display: inline-block; width: 130px">Brand  :  </label>
        <asp:TextBox runat="server" ID="txt_brand" />
        <asp:RequiredFieldValidator ControlToValidate="txt_brand" runat="server" ToolTip="Required field" 
            ErrorMessage="Required field" Display="Dynamic" ForeColor="Red" ValidationGroup="val_insertTab"/>
        <br />

        <label style="display: inline-block; width: 130px">Quantity Received  :  </label>
        <asp:TextBox runat="server" ID="txt_QtyReceived"/>
        <asp:RequiredFieldValidator ControlToValidate="txt_QtyReceived" runat="server" ToolTip="Required field" 
            ErrorMessage="Required field" Display="Dynamic" ForeColor="Red" ValidationGroup="val_insertTab"/>
        <asp:CompareValidator ID="val_QRecv" runat="server" ControlToValidate="txt_QtyReceived" Operator="DataTypeCheck" Type="Integer" 
            ErrorMessage="Value must be an integer!" Style="color:red" ValidationGroup="val_insertTab"/>
        <br />

        <label style="display: inline-block; width: 130px">Quantity Remaining  :  </label>
        <asp:TextBox runat="server" ID="txt_qtyRemaining"/>
        <asp:RequiredFieldValidator ControlToValidate="txt_qtyRemaining" runat="server" ToolTip="Required field" 
            ErrorMessage="Required field" Display="Dynamic" ForeColor="Red" ValidationGroup="val_insertTab"/>
        <asp:CompareValidator ID="val_QRem" runat="server" ControlToValidate="txt_qtyRemaining" Operator="DataTypeCheck" Type="Integer" 
            ErrorMessage="Value must be an integer!" Style="color:red" ValidationGroup="val_insertTab"/>
        <br />

        <label style="display: inline-block; width: 130px">Date Received  :  </label>
        <input runat="server" id="txt_dateReceived" type="date" value="2015-01-01"/>
        <asp:RequiredFieldValidator ControlToValidate="txt_dateReceived" runat="server" ToolTip="Required field" 
            ErrorMessage="Required field" Display="Dynamic" ForeColor="Red" ValidationGroup="val_insertTab"/>
        <br />
        <br />
        <asp:GridView ID="grd_ins" runat="server"/>
        <br/>
        <br/>
        <asp:Button runat="server" ID="btn_Insert" OnClick="btn_Insert_OnClick" Text="Insert Item" ValidationGroup="val_insertTab"/>


    </div>
    <div runat="server" id="div_DeleteTab">
        <asp:Repeater ID="rptr_delete" runat="server">
            <HeaderTemplate>
                <table>
                    <tr>
                        <th style="width:100px;">Product Id</th>
                        <th style="width:100px">Description</th>
                        <th style="width:100px">SKU</th>
                         <th style="width:100px">Brand</th>
                        <th style="width:100px">Date Received</th>
                        <th style="width:100px">Action</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="width:100px;text-align:center"><asp:Label ID ="lbl_prodId" runat="server" Text='<%#Eval("ProductId")%>'/></td>
                    <td style="width:100px;text-align:center"><asp:Label ID ="lbl_descr" runat="server" Text='<%#Eval("Descr")%>'/></td>
                    <td style="width:100px;text-align:center"><asp:Label ID ="lbl_SKU" runat="server" Text='<%#Eval("SKU")%>'/></td>
                    <td style="width:100px;text-align:center"><asp:Label ID ="lbl_brand" runat="server" Text='<%#Eval("Brand")%>'/></td>
                    <td style="width:100px;text-align:center"><asp:Label ID ="lbl_date" runat="server" Text='<%#Eval("DateReceived","{0:d}")%>'/></td>
                    <td style="width:100px;text-align:center"><asp:LinkButton id="lnkbtn_delete" runat="server" OnClick="btn_Delete_OnClick">delete</asp:LinkButton></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

    </div>

    <div runat="server" id="div_EnterCriteria">
        <h2>Select the criteria to display:</h2>
        
        <label style="display: inline-block; width: 110px">Product Desc :  </label>
        <asp:TextBox runat="server" ID="txt_EnterCritProdDesc" /><br />

        <label style="display: inline-block; width: 110px">Brand  :  </label>
        <asp:TextBox runat="server" ID="txt_EnterCritBrand" /><br />

        <label style="display: inline-block; width: 110px">Date received  :  </label>
        <input id="txt_EnterCritDate" type="date" runat="server" value="2013-01-01"/>
        <br />
        <br />
        <hr />
        <br />
        <br />
        <asp:Button runat="server" ID="btn_Display" OnClick="btn_Display_OnClick" Text="Display" Style="margin-left: 40px; width: 100px" />

        <br />
    </div>

    <div runat="server" id="div_DisplayData">
        <asp:GridView ID="grd_DisplayData" runat="server" class="grid" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
        <br />
        <hr />
        <br />
        <br />
        <asp:Button runat="server" ID="btn_Select" OnClick="btn_Select_OnClick" Text="<- Go back" Style="margin-left: 40px; width: 100px" />
        <br />
    </div>
    <hr/>
    
    <br/>
    <asp:Button ID="btn_logout" runat="server" Text="Logout" Style="margin-left: 40px; width: 100px" OnClick="btn_logout_OnClick"/>
    <br />
    <br />
</asp:Content>
