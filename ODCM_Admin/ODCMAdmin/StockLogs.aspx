<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="StockLogs.aspx.vb" Inherits="StockLogs" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
       font-family:Arial;
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
               width: 113px;
           }
           .auto-style4 {
               width: 113px;
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
           .auto-style10 {
               width: 166px;
               text-align: right;
           }

           .auto-style11 {
               height: 41px;
               width: 285px;
           }
           .auto-style12 {
               width: 285px;
           }
           .auto-style13 {
               height: 41px;
               width: 166px;
           }

    </style>
 
 
    <h2 style="font-family: 'Century Gothic'; font-weight: bold;" class ="text-center">STOCK INFORMATION LOGS</h2>
    <table style="width:100%; height: 76px;">
        <tr>
            <td class="auto-style7"></td>
            <td style="width: 88px; height: 41px;">
          
            </td>
            <td class="auto-style1"></td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td style="height: 41px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td style="width: 88px" class="text-right"> <telerik:RadLabel ID="RadLabel1" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Search:</telerik:RadLabel></td>
            <td class="auto-style2">
                <telerik:RadTextBox ID="RadTextBox1" Runat="server" Height="32px" Skin="Bootstrap" Width="196px" AutoPostBack="True" Font-Names="Century Gothic" Font-Size="Medium">
                </telerik:RadTextBox>
            </td>
            <td class="auto-style4">
                <telerik:RadLabel ID="RadLabel2" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Category:</telerik:RadLabel>
            </td>
            <td class="auto-style6">
                <telerik:RadComboBox ID="Category" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Width="230px" Skin="Bootstrap" AutoPostBack="True">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="ALL" Value="ALL" />
                        <telerik:RadComboBoxItem runat="server" Text="Consumables" Value="Consumables" />
                        <telerik:RadComboBoxItem runat="server" Text="Disposables" Value="Disposables" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td class="auto-style10">
                <telerik:RadLabel ID="RadLabel3" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Stock:</telerik:RadLabel>
            </td>
            <td class="auto-style12">
                <telerik:RadComboBox ID="Stock" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Width="124px" Skin="Bootstrap" AutoPostBack="True" Text="IN">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="ALL" Value="ALL" />
                        <telerik:RadComboBoxItem runat="server" Text="IN" Value="IN" />
                        <telerik:RadComboBoxItem runat="server" Text="OUT" Value="OUT" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td>
              
                   <strong>
                <telerik:RadButton ID="RadButton1" runat="server" Font-Bold="True" Font-Names="Century Gothic" Height="25px" style="font-size: 16px; margin-top: 0px" Text="Print" Width="117px" Skin="Bootstrap" BorderColor="#666666" CssClass="auto-style2" Target="_blank">
                </telerik:RadButton>
                </strong>
              
            </td>
        </tr>
    </table>
     <br />
    <center style="width: 100%">
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" 
        GroupPanelPosition="Top" Skin="Bootstrap" 
        style="font-family: 'Segoe UI'; font-size: medium; text-align: center" 
        Width="1158px" AllowPaging="True" Font-Names="Century Gothic" Font-Size="Medium">

<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <AlternatingItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Century Gothic" Font-Size="Medium" />
        <MasterTableView>
            <Columns>
                   <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">

                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblRowNumber" Text='<%# Container.DataSetIndex+1 %>'></asp:Label>
                         </ItemTemplate>

                        <HeaderStyle Width="50px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                   </telerik:GridTemplateColumn>
                   <telerik:GridBoundColumn DataField="Invoice" 
                    FilterControlAltText="Filter column8 column" HeaderText="Invoice Number" 
                    ReadOnly="True" UniqueName="column8">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ItemName" 
                    FilterControlAltText="Filter column column" HeaderText="Item Name" 
                    ReadOnly="True" UniqueName="column">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="UOM" 
                    FilterControlAltText="Filter column2 column" HeaderText="UOM" 
                    ReadOnly="True" UniqueName="column2">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Category" 
                    FilterControlAltText="Filter column5 column" HeaderText="Category" 
                    ReadOnly="True" UniqueName="column5">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="Stock" 
                    FilterControlAltText="Filter column6 column" HeaderText="Stock" 
                    ReadOnly="True" UniqueName="column6">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                  
                  <telerik:GridBoundColumn DataField="DateStock" 
                    FilterControlAltText="Filter column7 column" HeaderText="Date Stock" 
                    ReadOnly="True" UniqueName="column7">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Quantity" 
                    FilterControlAltText="Filter column1 column" HeaderText="Quantity" 
                    ReadOnly="True" UniqueName="column1">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <EditItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <FooterStyle Font-Names="Century Gothic" Font-Size="Medium" />
            <HeaderStyle Font-Names="Century Gothic" Font-Size="Medium" />
        <CommandItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Century Gothic" Font-Size="Medium" />
        <ActiveItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Century Gothic" Font-Size="Medium" />
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Century Gothic" Font-Size="Medium" />
            <PagerStyle Font-Names="Century Gothic" Font-Size="Medium" />
            <SelectedItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
    </telerik:RadGrid>
    </center>
</asp:Content>

