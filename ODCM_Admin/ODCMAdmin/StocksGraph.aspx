<%@ Page Title="Stocks Monitoring" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="StocksGraph.aspx.vb" Inherits="StocksGraph" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
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


           .auto-style2 {
               width: 173px;
              text-align: left;
          }
           .auto-style5 {
               height: 41px;
               width: 149px;
           }
           .auto-style6 {
               width: 149px;
           }
           .auto-style7 {
               height: 41px;
               width: 25px;
           }
           .auto-style8 {
               width: 25px;
           }
           

           .auto-style24 {
              height: 41px;
              width: 205px;
          }
          .auto-style25 {
              width: 205px;
              text-align: right;
          }
          .auto-style26 {
              width: 322px;
              text-align: right;
          }
          .auto-style27 {
              height: 41px;
              width: 322px;
          }


           </style>
 
 
  <script type="text/javascript">
      var $ = $telerik.$;
      function exportRadHtmlChart() {
          var exp = $find("<%=RadClientExportManager1.ClientID%>").exportPDF($telerik.$(".RadHtmlChart"));
      }
  </script>
    <table style="width:100%; height: 76px;">
        <tr>
            <td class="auto-style7"></td>
            <td class="auto-style27">&nbsp;</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox1" runat="server" style="display:none"></asp:TextBox>
                 <asp:TextBox ID="TextBox2" runat="server" style="display:none"></asp:TextBox>
                 <asp:TextBox ID="TextBox3" runat="server" style="display:none"></asp:TextBox>
            </td>
            <td class="auto-style24">&nbsp;</td>
            <td style="height: 41px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style26">
                <telerik:RadLabel ID="RadLabel2" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Category:</telerik:RadLabel>
            </td>
            <td class="auto-style6">
                <telerik:RadComboBox ID="Category" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Width="232px" Skin="Bootstrap" AutoPostBack="True" EmptyMessage="Choose Category">
                </telerik:RadComboBox>
            </td>
            <td class="auto-style25">
                &nbsp;</td>
            <td class="text-left">
              
                   <strong>
                <telerik:RadButton ID="RadButton1" runat="server" OnClientClicked="exportRadHtmlChart" Font-Bold="True" Font-Names="Century Gothic" Height="25px" style="font-size: 16px; margin-top: 0px" Text="Print" Width="117px" Skin="Bootstrap" BorderColor="#666666" CssClass="auto-style2" Target="_blank" AutoPostBack="False">
                </telerik:RadButton>
                </strong>
              
            </td>
        </tr>
    </table>
    <br />
    
    <center>
      <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"><PdfSettings FileName="DENTCAST_StocksMonitoring" /></telerik:RadClientExportManager>
        <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" Skin="Bootstrap" Font-Names="Century Gothic">
    <PlotArea>
        <Series>
            <telerik:ColumnSeries Name="Product" DataFieldY="Quantity" Gap="1" Spacing="0.4">
                <TooltipsAppearance DataFormatString="{0}" />
                <LabelsAppearance Visible="true" />
                <Appearance>
                            <FillStyle BackgroundColor="#850071"></FillStyle>
                        </Appearance>
            </telerik:ColumnSeries>
        </Series>
                 <Appearance>
                    <FillStyle BackgroundColor="Transparent"></FillStyle>
                </Appearance>
        <XAxis DataLabelsField="Name" AxisCrossingValue="0" Color="black" MajorTickType="Outside" MinorTickType="Outside"
                    Reversed="false">
            <LabelsAppearance DataFormatString="{0}" RotationAngle="0" Skip="0" Step="1"></LabelsAppearance>
                    <TitleAppearance Position="Center" RotationAngle="0" Text="Product Name">
                    </TitleAppearance>
        </XAxis>
        <YAxis AxisCrossingValue="0" Color="black" MajorTickSize="1" MajorTickType="Outside"
                    MinorTickType="None" Reversed="false">
            <LabelsAppearance DataFormatString="{0}" />
            <TitleAppearance Position="Center" RotationAngle="0" Text="Quantiy">
                    </TitleAppearance>
        </YAxis>
    </PlotArea>
    <Legend>
        <Appearance Visible="false" />
    </Legend>
</telerik:RadHtmlChart>
    </center>
     <br />
</asp:Content>

