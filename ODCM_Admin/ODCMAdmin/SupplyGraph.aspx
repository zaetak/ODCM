<%@ Page Title="Stocks Monitoring" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="SupplyGraph.aspx.vb" Inherits="SupplyGraph" %>
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
           .auto-style9 {
               height: 41px;
               width: 65px;
           }
           .auto-style10 {
               width: 65px;
              text-align: right;
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
              width: 223px;
          }
          .auto-style19 {
              height: 41px;
              width: 132px;
          }
          .auto-style20 {
              text-align: left;
              width: 132px;
          }


           .auto-style21 {
              height: 41px;
              width: 223px;
          }
          .auto-style22 {
              height: 41px;
              width: 117px;
          }
          .auto-style23 {
              width: 117px;
          }


           </style>
 
 
  <script type="text/javascript">
      var $ = $telerik.$;
      function exportRadHtmlChart() {
          var exp = $find("<%=RadClientExportManager1.ClientID%>").exportPDF($telerik.$(".RadHtmlChart"));
      }
  </script>
    <h2 style="font-family: 'Century Gothic'; font-weight: bold;" class ="text-center">SUPPLY INFORMATION STATISTICS</h2>
    <table style="width:100%; height: 76px;">
        <tr>
            <td class="auto-style7"></td>
            <td style="width: 88px; height: 41px;">
          
            </td>
            <td class="auto-style19"></td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox1" runat="server" style="display:none"></asp:TextBox>
                 <asp:TextBox ID="TextBox2" runat="server" style="display:none"></asp:TextBox>
                 <asp:TextBox ID="TextBox3" runat="server" style="display:none"></asp:TextBox>
            </td>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td style="height: 41px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td style="width: 88px" class="text-right"> <telerik:RadLabel ID="RadLabel1" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Stocks:</telerik:RadLabel></td>
            <td class="auto-style20">
                &nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="RadioButton1" runat="server" Text="IN" GroupName="stock" AutoPostBack="True" Font-Bold="True" Font-Names="Century Gothic"/> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="RadioButton2" runat="server" Text="OUT" GroupName="stock" AutoPostBack="True" Font-Bold="True" Font-Names="Century Gothic"/>
            </td>
            <td class="auto-style4">
                <telerik:RadLabel ID="RadLabel2" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Timespan:</telerik:RadLabel>
            </td>
            <td class="auto-style6">
                <telerik:RadComboBox ID="Category" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Width="192px" Skin="Bootstrap" AutoPostBack="True" EmptyMessage="Choose Timespan">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="Daily" Value="Daily" />
                        <telerik:RadComboBoxItem runat="server" Text="Weekly" Value="Weekly" />
                        <telerik:RadComboBoxItem runat="server" Text="Monthly" Value="Monthly" />
                        <telerik:RadComboBoxItem runat="server" Text="Yearly" Value="Yearly" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td class="auto-style10">
                <telerik:RadLabel ID="RadLabel3" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Date:</telerik:RadLabel>
            </td>
            <td class="auto-style23">
               <telerik:RadDatePicker ID="RadDatePicker1" runat="server" AutoPostBack="true" Skin="Bootstrap" Width="176px" Font-Names="Century Gothic">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Bootstrap"></Calendar>

<DateInput DisplayDateFormat="MM/dd/yyyy" DateFormat="MM/dd/yyyy" AutoPostBack="True" LabelWidth="40%">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
</telerik:RadDatePicker>
            </td>
            <td class="auto-style14">
               <telerik:RadLabel ID="RadLabel4" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    To</telerik:RadLabel></td>
            <td class="auto-style18">
               <telerik:RadDatePicker ID="RadDatePicker2" runat="server" AutoPostBack="true" Skin="Bootstrap" Width="176px" Font-Names="Century Gothic">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Bootstrap"></Calendar>

<DateInput DisplayDateFormat="MM/dd/yyyy" DateFormat="MM/dd/yyyy" AutoPostBack="True" LabelWidth="40%">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
</telerik:RadDatePicker>
            </td>
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
                    <TitleAppearance Position="Center" RotationAngle="0" Text="Name">
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
</telerik:RadHtmlChart>
    </center>
     <br />
</asp:Content>

