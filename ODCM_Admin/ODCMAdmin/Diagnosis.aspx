<%@ Page Title="Patient Diagnosis" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Diagnosis.aspx.vb" Inherits="Diagnosis" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
              <style type="text/css">
    .rgMasterTable
    {
        font-size: medium !important;
        font-family: 'Century Gothic' !important;
    }
</style>
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
               text-align: center;
           }
           .auto-style3 {
               height: 41px;
               width: 113px;
           }
           .auto-style4 {
               width: 113px;
               text-align: right;
           }
           .auto-style5 {
               height: 41px;
               width: 97px;
           }
           .auto-style6 {
               width: 97px;
               text-align: right;
           }
           .auto-style7 {
               height: 41px;
               width: 72px;
           }
           .auto-style8 {
               width: 72px;
           }
           .auto-style10 {
               width: 402px;
           }


           .auto-style11 {
               height: 41px;
               width: 402px;
           }


           </style>

    <table style="width:100%; height: 76px;">
        <tr>
            <td style="width: 100px; height: 41px;"></td>
            <td style="width: 88px; height: 41px;">
          
            </td>
            <td style="height: 41px"></td>
        </tr>
        <tr>
            <td style="width: 100px">&nbsp;</td>
            <td style="width: 88px"> <telerik:RadLabel ID="RadLabel1" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Search:</telerik:RadLabel></td>
            <td>
                <telerik:RadTextBox ID="RadTextBox1" Runat="server" Height="28px" Skin="Bootstrap" Width="301px" AutoPostBack="True" Font-Names="Century Gothic" Font-Size="Medium">
                </telerik:RadTextBox>
            </td>
        </tr>
    </table>
     <br />
    <center>
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

  <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" AllowSorting="True" Width="90%"
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowAutomaticDeletes="True" OnNeedDataSource="RadGrid1_NeedDataSource" AllowPaging="True" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" Skin="Bootstrap">
            <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

            <MasterTableView Width="100%" CommandItemDisplay="Top"
                DataKeyNames="ClientID" InsertItemDisplay="Top"
                InsertItemPageIndexAction="ShowItemOnFirstPage">
                <CommandItemSettings ShowAddNewRecordButton="false" />
                <Columns>
                    <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">

                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblRowNumber" Text='<%# Container.DataSetIndex+1 %>'></asp:Label>
                         </ItemTemplate>

                        <HeaderStyle Width="50px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />


                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="ClientID" 
                    FilterControlAltText="Filter column column" HeaderText="Last Name" 
                    ReadOnly="True" UniqueName="ID" Display="false">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LastName" 
                    FilterControlAltText="Filter column column" HeaderText="Last Name" 
                    ReadOnly="True" UniqueName="column">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FirstName" 
                    FilterControlAltText="Filter column1 column" HeaderText="First Name" 
                    ReadOnly="True" UniqueName="column1">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MiddleName" 
                    FilterControlAltText="Filter column2 column" HeaderText="Middle Name" 
                    ReadOnly="True" UniqueName="column2">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
              <telerik:GridButtonColumn HeaderText="View Diagnosis" ItemStyle-Width="170px" ButtonType="ImageButton" CommandName="View" ImageUrl="~/Images/View.png">
                     <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </telerik:GridButtonColumn>
            </Columns>
         </MasterTableView>
<FilterMenu RenderMode="Lightweight"></FilterMenu>
<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
    </telerik:RadGrid>
    </center>
</asp:Content>

