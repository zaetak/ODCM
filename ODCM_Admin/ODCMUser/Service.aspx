<%@ Page Title="Services Offered" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Service.aspx.vb" Inherits="Service" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
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


           .auto-style1 {
               height: 41px;
               width: 227px;
           }
           .auto-style2 {
               width: 227px;
           }
           .auto-style3 {
               height: 41px;
               width: 477px;
           }
           .auto-style4 {
               width: 477px;
               text-align: right;
           }
           .auto-style5 {
               height: 41px;
               width: 213px;
           }
           .auto-style6 {
               width: 213px;
           }
           .auto-style7 {
               height: 41px;
               width: 72px;
           }
           .auto-style8 {
               width: 72px;
           }
           .auto-style9 {
               height: 41px;
               width: 81px;
           }
           .auto-style10 {
               width: 81px;
           }


              .auto-style11 {
                  width: 100%;
                  height: 76px;
              }


           </style>
        <h2 style="font-family: 'Century Gothic'; font-weight: bold;" class ="text-center">SERVICES OFFERED</h2>
        <table class="auto-style11">
        <tr>
            <td class="auto-style7"></td>
            <td style="width: 88px; height: 41px;">
          
            </td>
            <td class="auto-style1"></td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td style="height: 41px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td style="width: 88px" class="text-right"> <telerik:RadLabel ID="RadLabel1" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Search:</telerik:RadLabel></td>
            <td class="auto-style2">
                <telerik:RadTextBox ID="RadTextBox1" Runat="server" Height="32px" Skin="Bootstrap" Width="227px" AutoPostBack="True" Font-Names="Century Gothic" Font-Size="Medium">
                </telerik:RadTextBox>
            </td>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style6">
              
                   <strong>
                <telerik:RadButton ID="RadButton1" runat="server" Font-Bold="True" Font-Names="Century Gothic" Height="25px" style="font-size: 16px; margin-top: 0px" Text="Print" Width="117px" Skin="Bootstrap" BorderColor="#666666" CssClass="auto-style2" Target="_blank">
                </telerik:RadButton>
                </strong>
              
            </td>
            <td class="auto-style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
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
    <center>
    <div>
         <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" AllowSorting="True" Width="60%" AllowAutomaticDeletes="True" OnNeedDataSource="RadGrid1_NeedDataSource" AllowPaging="True" runat="server" OnItemCreated="RadGrid_ItemCreated" OnUpdateCommand="RadGrid_ItemUpdated" OnInsertCommand="RadGrid_InsertCommand"
            OnDeleteCommand="RadGrid_ItemDeleted" AutoGenerateColumns="False" GroupPanelPosition="Top" Skin="Bootstrap" Font-Names="Century Gothic" Font-Size="Medium">
             <FooterStyle Font-Names="Century Gothic" Font-Size="Medium" />
             <HeaderStyle Font-Names="Century Gothic" Font-Size="Medium" />
             <CommandItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
             <ActiveItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
             <ItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
            <PagerStyle Mode="NextPrevAndNumeric" Font-Names="Century Gothic" Font-Size="Medium"></PagerStyle>
             <AlternatingItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
            <MasterTableView Width="100%" CommandItemDisplay="Top"
                DataKeyNames="Services Offered" InsertItemDisplay="Top"
                InsertItemPageIndexAction="ShowItemOnFirstPage">
                <CommandItemSettings ShowAddNewRecordButton="false" />
                <Columns>
                    <%--<telerik:GridEditCommandColumn>
                    </telerik:GridEditCommandColumn>--%>
                     <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                         <ItemTemplate>
                                <asp:Label runat="server" ID="lblRowNumber" Text='<%# Container.DataSetIndex+1 %>'></asp:Label>
                         </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                     <telerik:GridBoundColumn DataField="ID" UniqueName="ID" HeaderText="Service ID" Display="false">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Services Offered" UniqueName="Services" HeaderText="Services Offered"
                        MaxLength="50">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </telerik:GridBoundColumn>
                    <%--<telerik:GridButtonColumn 
                        ConfirmText="Delete record?"
                        ConfirmDialogType="RadWindow"
                        ConfirmTitle="Delete"
                        ButtonType="ImageButton" 
                        CommandName="Delete"
                        FilterControlAltText="Filter DeleteColumn column"
                        Text="Delete"
                        UniqueName="DeleteColumn" 
                        Resizable="false" 
                        >
                        
                        <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>
                        <ItemStyle CssClass="ButtonColumn" />
                    </telerik:GridButtonColumn>--%>
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
</asp:Content>

