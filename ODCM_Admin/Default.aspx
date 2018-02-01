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
    
    <div class="demo-container">
        <telerik:RadAjaxPanel runat="server" ID="RadAjaxPanel1">
           <br /><br />
            <telerik:RadImageGallery RenderMode="Lightweight" runat="server" ID="RadImageGallery1" Height="450px" Width="1200px" Skin="Bootstrap" DisplayAreaMode="Image" LoopItems="True" ShowLoadingPanel="True">
            <ToolbarSettings ShowSlideshowButton="true" />
                <Items>
                    <telerik:ImageGalleryItem Description="" ImageUrl="Images/1a.jpg" ThumbnailUrl="Images/1a.jpg" Title="" />
                    <telerik:ImageGalleryItem Description="" ImageUrl="Images/2a.jpg" ThumbnailUrl="Images/2a.jpg" Title="" />
                    <telerik:ImageGalleryItem Description="" ImageUrl="Images/3a.jpg" ThumbnailUrl="Images/3a.jpg" Title="" />
                    <telerik:ImageGalleryItem Description="" ImageUrl="Images/4a.jpg" ThumbnailUrl="Images/4a.jpg" Title="" />
                    <telerik:ImageGalleryItem Description="" ImageUrl="Images/5a.jpg" ThumbnailUrl="Images/5a.jpg" Title="" />
                    <telerik:ImageGalleryItem Description="" ImageUrl="Images/6a.jpg" ThumbnailUrl="Images/6a.jpg" Title="" />
                    <telerik:ImageGalleryItem Description="" ImageUrl="Images/7a.jpg" ThumbnailUrl="Images/7a.jpg" Title="" />
                </Items>
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
           
            <div class="Info">
                <h3>
                </h3>
                <span>
                </span>
            </div>
        </telerik:RadAjaxPanel>
    </div>
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
    <div class="row">
        <div class="col-md-4">
            <h2></h2>
            <p>
                
            </p>
        </div>
        <div class="col-md-4">
            <h2></h2>
            <p>
                
            </p>
        </div>
        <div class="col-md-4">
            <h2></h2>
            <p>
                
            </p>
        </div>
    </div>

</asp:Content>
