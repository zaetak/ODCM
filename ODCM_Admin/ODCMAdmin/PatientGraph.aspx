<%@ Page Title="Stocks Monitoring" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="PatientGraph.aspx.vb" Inherits="PatientGraph" %>
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
           

           .auto-style14 {
              text-align: center;
              width: 51px;
          }
          .auto-style15 {
              height: 41px;
              width: 51px;
          }


           .auto-style18 {
              text-align: left;
              width: 180px;
          }
          

           .auto-style21 {
              height: 41px;
              width: 180px;
          }
          .auto-style22 {
              height: 41px;
              width: 117px;
          }
          .auto-style23 {
              width: 117px;
          }


           .auto-style24 {
              height: 41px;
              width: 147px;
          }
          .auto-style25 {
              width: 147px;
              text-align: right;
          }
          .auto-style26 {
              width: 155px;
              text-align: right;
          }
          .auto-style27 {
              height: 41px;
              width: 155px;
          }


           .auto-style28 {
        height: 41px;
        width: 118px;
    }
    .auto-style29 {
        width: 118px;
        text-align: right;
    }
    .auto-style31 {
        width: 110px;
        text-align: right;
    }
    .auto-style32 {
        height: 41px;
        width: 110px;
    }


           </style>
 
 
  <script type="text/javascript">
      var $ = $telerik.$;
      function exportRadHtmlChart() {
          var exp = $find("<%=RadClientExportManager1.ClientID%>").exportPDF($telerik.$(".RadHtmlChart"));
      }
  </script>
    <h2 style="font-family: 'Century Gothic'; font-weight: bold;" class ="text-center">PATIENT INFORMATION STATISTICS</h2>
    <table style="width:100%; height: 76px;">
        <tr>
            <td class="auto-style7"></td>
            <td class="auto-style32">&nbsp;</td>
            <td class="auto-style27">&nbsp;</td>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox1" runat="server" style="display:none"></asp:TextBox>
                 <asp:TextBox ID="TextBox2" runat="server" style="display:none"></asp:TextBox>
                 <asp:TextBox ID="TextBox3" runat="server" style="display:none"></asp:TextBox>
            </td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td style="height: 41px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style31">
                <telerik:RadLabel ID="RadLabel5" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Last Visit:</telerik:RadLabel>
            </td>
            <td class="auto-style26">
                <telerik:RadComboBox ID="Sex0" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Width="167px" Skin="Bootstrap" AutoPostBack="True" EmptyMessage="Choose Sex">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="All" Value="All" />
                        <telerik:RadComboBoxItem runat="server" Text="January" Value="January" />
                        <telerik:RadComboBoxItem runat="server" Text="February" Value="February" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td class="auto-style29">
                <telerik:RadLabel ID="RadLabel2" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Sex:</telerik:RadLabel>
            </td>
            <td class="auto-style6">
                <telerik:RadComboBox ID="Sex" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Width="167px" Skin="Bootstrap" AutoPostBack="True" EmptyMessage="Choose Sex">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="All" Value="All" />
                        <telerik:RadComboBoxItem runat="server" Text="Male" Value="Male" />
                        <telerik:RadComboBoxItem runat="server" Text="Female" Value="Female" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td class="auto-style25">
                <telerik:RadLabel ID="RadLabel3" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Age:</telerik:RadLabel>
            </td>
            <td class="auto-style23">
                <telerik:RadTextBox ID="txtfrom" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="117px" AutoPostBack="True">
                </telerik:RadTextBox>
            </td>
            <td class="auto-style14">
               <telerik:RadLabel ID="RadLabel4" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    To</telerik:RadLabel></td>
            <td class="auto-style18">
                <telerik:RadTextBox ID="txtto" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="117px" AutoPostBack="True">
                </telerik:RadTextBox>
            </td>
            <td class="text-left">
              
                   <strong>
                <telerik:RadButton ID="RadButton1" runat="server" Font-Bold="True" Font-Names="Century Gothic" Height="25px" style="font-size: 16px; margin-top: 0px" Text="Print" Width="117px" Skin="Bootstrap" BorderColor="#666666" CssClass="auto-style2" Target="_blank"></telerik:RadButton>
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
            <telerik:ColumnSeries Name="Product" DataFieldY="Age" Gap="1" Spacing="0.4">
                <TooltipsAppearance DataFormatString="{0}" />
                <LabelsAppearance Visible="true" />
                <Appearance>
                            <FillStyle BackgroundColor="79, 129, 189"></FillStyle>
                        </Appearance>
            </telerik:ColumnSeries>
        </Series>
                 <Appearance>
                    <FillStyle BackgroundColor="Transparent"></FillStyle>
                </Appearance>
        <XAxis DataLabelsField="Gender" AxisCrossingValue="0" Color="black" MajorTickType="Outside" MinorTickType="Outside"
                    Reversed="false">
            <LabelsAppearance DataFormatString="{0}" RotationAngle="0" Skip="0" Step="1"></LabelsAppearance>
                    <TitleAppearance Position="Center" RotationAngle="0" Text="Gender">
                    </TitleAppearance>
        </XAxis>
        <YAxis AxisCrossingValue="0" Color="black" MajorTickSize="1" MajorTickType="Outside"
                    MinorTickType="None" Reversed="false">
            <LabelsAppearance DataFormatString="{0}" />
            <TitleAppearance Position="Center" RotationAngle="0" Text="Quantity">
                    </TitleAppearance>
        </YAxis>
    </PlotArea>
    <Legend>
        <Appearance Visible="false" />
    </Legend>

<Zoom Enabled="False"></Zoom>
</telerik:RadHtmlChart>
    </center>
     <br />
</asp:Content>

