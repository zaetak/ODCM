<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .demo-container .Heading {
    line-height: 60px;
    margin: 0;
    padding: 20px;
    /*border-top: 2px solid #006198;*/
    font: normal 25px Calibri, sans-serif;
    /*background: #FEFEFE;*/
    /*color: #9d2900;*/
    /*box-shadow: 0px 0px 2px #888888;*/
}
 
.Info {
    padding: 20px;
    /*background: #F4F4F4;
    margin: 0;
    font: normal 14px "Segoe UI", sans-serif;
    color: #616569;
    box-shadow: 0px 0px 2px #888888;*/
}
 
.demo-container .Info h3 {
    margin: 0;
    padding-bottom: 15px;
    font-weight: lighter;
    font-size: 24px;
    /*color: #006198;*/
}
 
div.demo-container {
    width: 100%;
   
}
        </style>
    
   <table style="width:100%">
       <tr>
           <td style="width:60%">
                 <telerik:RadAjaxPanel runat="server" ID="RadAjaxPanel1" Width="100%">
           <br />
            <telerik:RadImageGallery RenderMode="Lightweight" runat="server" ID="RadImageGallery1" Height="450px" Width="100%" Skin="Bootstrap" DisplayAreaMode="Image" LoopItems="True" ShowLoadingPanel="True" ImagesFolderPath="~/ODCMAdmin/SplashImage">
            <ToolbarSettings ShowSlideshowButton="true" />
                <ThumbnailsAreaSettings Mode="ImageSliderPreview" ScrollButtonsTrigger="Hover" />
                <ImageAreaSettings Height="100%" Width="100%" NavigationMode="Zone" ShowDescriptionBox="true" />
                <ToolbarSettings Position="None" />
                <ClientSettings AllowKeyboardNavigation="True">
                    <ClientEvents OnImageGalleryCreated="imageGalleryCreated" />
                    <AnimationSettings SlideshowSlideDuration="2500">
                        <NextImagesAnimation Easing="Random" Speed="2000" Type="Random" />
                        <PrevImagesAnimation Easing="Random" Speed="2000" Type="Random" />
                    </AnimationSettings>
                </ClientSettings>
            </telerik:RadImageGallery>
        </telerik:RadAjaxPanel>
           </td>
           <td style="width:2%;">

           </td>
           <td style="width:40%">
                <%--<div class="panel panel-default" style="width:100%;">--%>
            <section runat="server" id="loginForm">
                    <h4 style="font-family: 'Century Gothic'">Log in.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group" ID ="formLogin">
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
                            
                            <asp:Button runat="server"  OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                            
                        </div>
                    </div>
                <p class="col-md-offset-1 col-md-11" style="font-family: 'Century Gothic'; font-size: medium;  margin-left:90px;margin-top:10px;">
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" Font-Names="Century Gothic" Font-Size="Medium">Register</asp:HyperLink>
                    to have an account.
                </p>
            </section>
      <%--  </div>--%>
           </td>
       </tr>
       </table>
    <table style="width:200% !important;">
       <tr>
           <td>
                   <asp:Image ID="Image1" ImageUrl="~/Images/dentcast.jpeg" runat="server" style="margin-left:100px;margin-top:20px;" Height="272px" Width="410px" />
                
           </td>
           <td></td>
           <td>
              <asp:Image ID="Image2" ImageUrl="~/Images/dentcast.jpeg" runat="server" Height="168px" Width="407px" />
              </td>
          
        
       </tr>
       </table>
      
   
      <asp:PlaceHolder runat="server">
        <script type="text/javascript">
            function imageGalleryCreated(sender, args) {
                var gallery = sender;

                gallery.playSlideshow();

                $telerik.$(".rigActiveImage").on("mouseover", function () {
                    gallery.stopSlideshow();
                });

                $telerik.$(".rigActiveImage").on("mouseleave", function () {
                    gallery.playSlideshow();
                });
            }
        </script>
 </asp:PlaceHolder>
   

</asp:Content>
