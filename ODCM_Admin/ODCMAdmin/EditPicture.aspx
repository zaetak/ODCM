<%@ Page Title="Edit Picture" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="EditPicture.aspx.vb" Inherits="EditPicture" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
          <style type="text/css">
                         
    .ModalBackground
{
    background-color:Gray;
    filter: alpha(opacity=70);
    opacity: 0.7;
    z-index: 999;
 
}
            .MyButton 
   { 
       background-color: #e7e7e7;
       color: black;
       font-size: 13px;
       padding: 8px 12px;
       border-radius: 4px;
   } 


           .auto-style5 {
               height: 141px;
               width: 568px;
           }
              .auto-style11 {
                  width: 110px;
                  height: 7px;
              }
              

              .auto-style14 {
                  width: 72px;
                  height: 40px;
              }


              .auto-style15 {
                  width: 72px;
                  height: 7px;
              }
              .auto-style16 {
                  width: 72px;
                  height: 52px;
              }


           </style>
        <h2 style="font-family: 'Century Gothic'; font-weight: bold;" class ="text-center">EDIT PICTURES ON LANDING PAGE</h2>

     <br />
     <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                    <telerik:AjaxUpdatedControl ControlID="RadWindowManager1" />
                    <%--<telerik:AjaxUpdatedControl ControlID="RadInputManager1" />--%>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" Skin="Bootstrap" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <telerik:RadButton ID="RadButton1" runat="server" CssClass="btn btn-default" style="font-family: 'Segoe UI'; font-size: medium" Text="Add Image" Width="112px" Skin="Bootstrap" />
    <center>
    <div>
         
         <telerik:RadGrid 

         RenderMode="Lightweight" 
         ID="RadGrid1" 
         ShowPrintButton="true"
         AllowSorting="True" Width="50%"
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True"  AllowAutomaticDeletes="True" OnNeedDataSource="RadGrid1_NeedDataSource" AllowPaging="True" runat="server"
            OnDeleteCommand="RadGrid_ItemDeleted" AutoGenerateColumns="False" GroupPanelPosition="Top" Skin="Bootstrap" Font-Names="Century Gothic" Font-Size="Medium"
            >
             <FooterStyle Font-Names="Century Gothic" Font-Size="Medium" />
             <HeaderStyle Font-Names="Century Gothic" Font-Size="Medium" />
             <CommandItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
             <ActiveItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
             <ItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
            <PagerStyle Mode="NextPrevAndNumeric" Font-Names="Century Gothic" Font-Size="Medium"></PagerStyle>
             
             
             <ExportSettings IgnorePaging="true" OpenInNewWindow="true">
                <Pdf PageHeight="210mm" PageWidth="297mm" DefaultFontFamily="Arial Unicode MS" PageTopMargin="45mm"
                    BorderStyle="Medium" BorderColor="#666666">
                </Pdf>
            </ExportSettings>
            
            
            
            
             <AlternatingItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
            
            
            
            
            <MasterTableView Width="100%" 
                DataKeyNames="picturename">
                <Columns>
                   
                    <telerik:GridBoundColumn DataField="id" UniqueName="id" HeaderText="" >
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                     <HeaderStyle Width="50px"></HeaderStyle>
                         <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="picturename" UniqueName="picturename" HeaderText="UOM ID" Display="false">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </telerik:GridBoundColumn>
                 
                     <telerik:GridTemplateColumn DataField="picture" HeaderText="Pictures" UniqueName="Upload">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("picture") %>' Width="400px" Height="300px"/>
                        </ItemTemplate>
                       <EditItemTemplate>
                            <telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" ID="AsyncUpload1"
                                AllowedFileExtensions="jpg,jpeg,png,gif" MaxFileSize="1048576">
                            </telerik:RadAsyncUpload>
                        </EditItemTemplate>
                      <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </telerik:GridTemplateColumn>
                        <telerik:GridButtonColumn 
                        ConfirmText="Delete this picture?"
                        ConfirmDialogType="RadWindow"
                        ConfirmTitle="Delete"
                        ButtonType="ImageButton" 
                        CommandName="Delete"
                        FilterControlAltText="Filter DeleteColumn column"
                        Text="Delete"
                        UniqueName="DeleteColumn" 
                        Resizable="false">
                        <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>
                        <ItemStyle CssClass="ButtonColumn" />
                    </telerik:GridButtonColumn>

                </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
            </MasterTableView>
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
             <SelectedItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
        </telerik:RadGrid>

       <br /> 
       </div>
        </center>
     <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" Skin="Bootstrap" />

     <asp:Button ID="Button2" runat="server" style="font-family: 'Segoe UI'; font-size: medium;display:none" Text="Add" Width="93px" Height="33px"/> 
      <asp1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button2" PopupControlID="ModalPanel"
                                CancelControlID="btnClose" BackgroundCssClass="ModalBackground">
                </asp1:ModalPopupExtender>
                <asp:Panel ID="ModalPanel" runat="server" Height="153px" style="border: 3px solid Black; background-color:#FFFFFF; padding-top:10px; padding-left:10px" Width="576px">
                    <table class="auto-style5">
                        <tr>
                            <td class="auto-style15">
                                <asp:Label ID="lblID" runat="server" Text="Label" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style11"></td>
                        </tr>
                        <tr>
                            <td class="auto-style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<strong><asp:Label ID="Label4" runat="server" Text="Picture:"></asp:Label>
                                </strong></td>
                            <td class="auto-style16">
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="311px" accept=".jpg,.png,.jpeg" />
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right" colspan="2"><center>&nbsp;<telerik:RadButton ID="btnEdit" runat="server" CssClass="btn btn-default" style="font-family: 'Segoe UI'; font-size: medium" Text="Upload" Width="112px" Skin="Bootstrap" />
                                &nbsp;<telerik:RadButton ID="btnClose" runat="server" CssClass="btn btn-default" style="font-family: 'Segoe UI'; font-size: medium" Text="Close" Width="112px" Skin="Bootstrap" /></center>
                            </td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
</asp:Content>

