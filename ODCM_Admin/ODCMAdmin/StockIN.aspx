<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="StockIN.aspx.vb" Inherits="StockIN" %>
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
           .auto-style9 {
               height: 41px;
               width: 81px;
           }
           .auto-style10 {
               width: 81px;
           }


           .auto-style20 {
               width: 715px;
               height: 182px;
           }
           .auto-style22 {
               width: 287px;
               text-align: left;
           }
           

           .auto-style27 {
               left: 0px;
               top: 14px;
           }


           .auto-style28 {
               left: 0px;
               top: 14px;
               right: 93px;
           }


                  .auto-style49 {
                      height: 40px;
                  }
                  .auto-style55 {
                      width: 213px;
                      height: 39px;
                      text-align: right;
                  }
                  .auto-style56 {
                      width: 36px;
                      height: 39px;
                  }
                  .auto-style57 {
                      width: 287px;
                      height: 39px;
                      text-align: left;
                  }
                  .auto-style58 {
                      height: 39px;
                  }

                  .auto-style62 {
                      width: 36px;
                      height: 40px;
                  }
                  .auto-style63 {
                      width: 36px;
                  }
                  
                  .auto-style69 {
                      width: 213px;
                      text-align: right;
                      height: 40px;
                  }
                  .auto-style73 {
                      width: 287px;
                      height: 40px;
                  }
    </style>
<script type="text/javascript">
        function callBackFn(arg) {
            window.location.href = "StockIN.aspx";
            return false;
        }
    </script>
    <h2 style="font-family: 'Century Gothic'; font-weight: bold;" class ="text-center">STOCK IN</h2>
    <table style="width:100%; height: 76px;">
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
                &nbsp;</td>
            <td>

            </td>
        </tr>
    </table>
     <br />
    <center style="width: 1281px">
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" 
        GroupPanelPosition="Top" Skin="Bootstrap" 
        style="font-family: 'Segoe UI'; font-size: medium; text-align: center" 
        Width="1158px" Font-Names="Century Gothic" Font-Size="Medium">

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
                <telerik:GridBoundColumn DataField="Quantity" 
                    FilterControlAltText="Filter column1 column" HeaderText="Quantity" 
                    ReadOnly="True" UniqueName="column1">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                  <telerik:GridButtonColumn CommandName="Stock" 
                    FilterControlAltText="Filter column8 column" HeaderText="Stock IN" 
                    UniqueName="column8" Text="Update" ButtonType="PushButton">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridButtonColumn>
                <telerik:GridBoundColumn DataField="SupplyID" Display="False" FilterControlAltText="Filter column3 column" UniqueName="column3">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <EditItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <FooterStyle Font-Names="Century Gothic" />
            <HeaderStyle Font-Names="Century Gothic" Font-Size="Medium" />
        <CommandItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Century Gothic" Font-Size="Medium" />
        <ActiveItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Century Gothic" Font-Size="Medium" />
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Century Gothic" Font-Size="Medium" />
            <PagerStyle Font-Names="Century Gothic" />
            <SelectedItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
    </telerik:RadGrid>
    </center>
     <asp:Button ID="Button1" runat="server" 
                    style="font-family: 'Segoe UI'; font-size: medium;display:none;" Text="Add" Width="93px" 
                    Height="33px"/>
      <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button1" PopupControlID="ModalPanel"
                                CancelControlID="CloseButton" BackgroundCssClass="ModalBackground">
                        </asp:ModalPopupExtender>

     <asp:Panel ID="ModalPanel" runat="server" Width="719px" 
                    style="border: 3px solid Black; background-color:#FFFFFF; padding-top:10px; padding-left:10px;display:none; font-family: 'Century Gothic'; font-size: medium;" 
                    Height="270">
                    <table class="auto-style20">
                        <tr>
                            <td class="auto-style62">
                                </td>
                            <td class="auto-style69">
                                <telerik:RadLabel ID="RadLabel3" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="Medium" Skin="Bootstrap" style="font-size: large">
                                    Item Name:</telerik:RadLabel>
                            </td>
                            <td class="auto-style73">
                                <telerik:RadTextBox ID="ItemName" Runat="server" Font-Names="Arial" Font-Size="Medium" Height="28px" Skin="Bootstrap" Width="237px">
                                </telerik:RadTextBox>
                            </td>
                            <td class="auto-style49">
                                </td>
                        </tr>

                        <tr>
                            <td class="auto-style62">
                                </td>
                            <td class="auto-style69">
                                <telerik:RadLabel ID="RadLabel4" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="Medium" Skin="Bootstrap" style="font-size: large">
                                    Stock:</telerik:RadLabel>
                            </td>
                            <td class="auto-style73">
                                <telerik:RadTextBox ID="Quantity" Runat="server" Font-Names="Arial" Font-Size="Medium" Height="28px" Skin="Bootstrap" Width="237px" Enabled="false">
                                </telerik:RadTextBox>
                            </td>
                            <td class="auto-style49">
                                </td>
                        </tr>
                        <tr>
                            <td class="auto-style56"></td>
                            <td class="auto-style55">
                                <telerik:RadLabel ID="RadLabel6" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="Medium" Skin="Bootstrap" style="font-size: large">
                                    Quantity:</telerik:RadLabel>
                            </td>
                            <td class="auto-style57">
                                <telerik:RadTextBox ID="STIN" Runat="server" Font-Names="Arial" Font-Size="Medium" Height="28px" Skin="Bootstrap" Width="237px">
                                </telerik:RadTextBox>
                            </td>
                            <td class="auto-style58">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="STIN" CssClass="style3" Display="Dynamic" ErrorMessage="Input numbers only." Font-Italic="true" ForeColor="red" SetFocusOnError="True" ValidationExpression="^\d+$" ValidationGroup="UA"> </asp:RegularExpressionValidator>
                            </td>
                        </tr>



                        <tr>
                            <td class="auto-style56"></td>
                            <td class="auto-style55">
                                <telerik:RadLabel ID="RadLabel5" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="Medium" Skin="Bootstrap" style="font-size: large">
                                    Invoice:</telerik:RadLabel>
                            </td>
                            <td class="auto-style57">
                                <telerik:RadTextBox ID="Invoice" Runat="server" Font-Names="Arial" Font-Size="Medium" Height="28px" Skin="Bootstrap" Width="237px">
                                </telerik:RadTextBox>
                            </td>
                        </tr>


                        <tr>
                            <td class="auto-style63">&nbsp;</td>
                            <td class="auto-style6"><strong>
                                <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true" RenderMode="Lightweight">
                                </telerik:RadWindowManager>
                                </strong></td>
                            <td class="auto-style22">&nbsp;&nbsp;&nbsp; <strong>
                 <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <telerik:RadButton ID="SaveButton" runat="server" CssClass="auto-style27" ValidationGroup="UA" Font-Bold="True" Skin="Bootstrap" Text="Save" Width="84px">
                                </telerik:RadButton>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <telerik:RadButton ID="CloseButton" runat="server" CssClass="auto-style28" Font-Bold="True" Skin="Bootstrap" Text="Close" Width="84px">
                                </telerik:RadButton>
                        </telerik:RadAjaxPanel>
     <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
            </telerik:RadAjaxLoadingPanel>
                                </strong></td>
                            <td class="style32">
                                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
</asp:Panel>
</asp:Content>

