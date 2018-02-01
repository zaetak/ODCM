<%@ Page Title="Log in" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.vb" Inherits="Account_Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   
    <h2 style="font-family: 'Century Gothic'"><%: Title %>.</h2>
    <div class="container " style=" height: 480px; width: 100%;">
        <div class="col-md-6 ">
            <section id="loginForm">
                <div class="form-horizontal" style="font-family: 'Century Gothic'">
                    <h4 style="font-family: 'Century Gothic'">Use administrator account to log in.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-3 control-label" Font-Size="Medium">Username:</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                CssClass="text-danger" ErrorMessage="The user name field is required." Font-Size="Medium" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-3 control-label" Font-Size="Medium">Password:</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." Font-Size="Medium" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-9">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" Font-Size="Medium" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe" Font-Size="Medium">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-9">
                            <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" EnableShadow="true">
                            </telerik:RadWindowManager>
                            
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                            
                        </div>
                    </div>
                </div>
                <p class="col-md-offset-1 col-md-11" style="font-family: 'Century Gothic'; font-size: medium;">
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" Font-Names="Century Gothic" Font-Size="Medium">Register</asp:HyperLink>
                    if you don't have an account.
                </p>
            </section>
        </div>
    </div>
</asp:Content>

