<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="eGrocery1.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="register_inner" style="padding: 20px 20px 20px 20px;width:600px">
        <asp:LinkButton ID="btn_registerLink" runat="server" Text="Register" OnClick="btn_registerLink_OnClick" Style="margin-right: 80px" CausesValidation="false"/>
        <asp:LinkButton ID="btn_loginLink" runat="server" Text="Login" OnClick="btn_loginLink_OnClick" CausesValidation="false"/>
        <hr />
        <br />
        <div id="register" runat="server">

            <label style="display: inline-block; width: 110px">Name  :  </label>
            <asp:TextBox runat="server" ID="txt_Name" />
            <asp:RequiredFieldValidator ControlToValidate="txt_Name" runat="server" ToolTip="Required field"  ErrorMessage="Required field" Display="Dynamic" ForeColor="Red"/>
            <br />

            <label style="display: inline-block; width: 110px">Type  :  </label>
            <asp:DropDownList runat="server" ID="ddl_Type">
                <asp:ListItem Text="Owner" Value="Owner" Selected="True" />
                <asp:ListItem Text="Employee" Value="Employee" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ControlToValidate="ddl_Type" runat="server" ToolTip="Required field" ErrorMessage="Required field" Display="Dynamic" BorderColor="Red"/>
            <br />

            <label style="display: inline-block; width: 110px">Userid  :  </label>
            <asp:TextBox runat="server" ID="txt_Userid" />
            <asp:RequiredFieldValidator ControlToValidate="txt_Userid" runat="server" ToolTip="Required field" ErrorMessage="Required field" Display="Dynamic" ForeColor="Red"/>
            <br />

            <label style="display: inline-block; width: 110px">Email  :  </label>
            <asp:TextBox runat="server" ID="txt_Email" />
            <asp:RequiredFieldValidator ControlToValidate="txt_Email" runat="server" ToolTip="Required field" ErrorMessage="Required field" Display="Dynamic" ForeColor="Red"/>
            <br />

            <label style="display: inline-block; width: 110px">Password  :  </label>
            <input runat="server" id="txt_Password" type="password" />
            <asp:RequiredFieldValidator ControlToValidate="txt_Password" runat="server" ToolTip="Required field" ErrorMessage="Required field" Display="Dynamic" ForeColor="Red"/>
            <br />

            <label style="display: inline-block; width: 110px">Confirm Password  :  </label>
            <input runat="server" id="txt_confirmPassword" type="password" />
            <asp:RequiredFieldValidator ControlToValidate="txt_confirmPassword" runat="server" ToolTip="Required field" ErrorMessage="Required field" Display="Dynamic" ForeColor="Red"/>
            <asp:CompareValidator ControlToValidate="txt_confirmPassword" ControlToCompare="txt_Password" runat="server" ToolTip="Passwords mismatch" ErrorMessage="Passwords mismatch" Display="Dynamic" ForeColor="Red"/>
            <br />
            <asp:label ID="lbl_userRegister" runat="server"/>
            <br/>
            <asp:Button runat="server" ID="btn_Register" OnClick="btn_Register_OnClick" Text="Register"/>
        </div>
        <div id="login" runat="server">

            <label style="display: inline-block; width: 110px">User Id  :  </label>
            <asp:TextBox runat="server" ID="txt_login_userid" /><br />
            <label style="display: inline-block; width: 110px">Password  :  </label>
            <input runat="server" id="txt_login_password" type="password" />
            <asp:label ID="lbl_credentials" runat="server" Style="color:red"/>
            <br/>
            <br/>
            <asp:Button runat="server" ID="btn_Login" OnClick="btn_Login_OnClick" Text="Login" />
        </div>
    </div>
</asp:Content>
