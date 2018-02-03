<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="StockOUT.aspx.vb" Inherits="StockOUT" %>
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


           .auto-style2 {
               width: 1000px;
                         text-align: right;
                         height: 39px;
                     }
           .auto-style3 {
               height: 64px;
               width: 113px;
           }
           .auto-style5 {
               height: 64px;
               width: 213px;
           }
           .auto-style6 {
               width: 213px;
           }
           .auto-style7 {
               height: 64px;
               width: 72px;
           }
           .auto-style8 {
               width: 72px;
                         height: 39px;
                     }
           .auto-style10 {
               width: 172px;
                         height: 39px;
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
                     .auto-style74 {
                         height: 64px;
                         width: 812px;
                     }
                     .auto-style75 {
                         height: 64px;
                         width: 172px;
                     }
                     .auto-style83 {
                         width: 100%;
                         height: 76px;
                     }
                     .auto-style86 {
                         width: 72px;
                         height: 40px;
                     }
                     .auto-style88 {
                         width: 812px;
                         text-align: right;
                         height: 40px;
                     }
                     .auto-style89 {
                         width: 113px;
                         text-align: left;
                         height: 40px;
                     }
                     .auto-style90 {
                         width: 213px;
                         height: 40px;
                     }
                     .auto-style91 {
                         width: 172px;
                         height: 40px;
                     }
                     .auto-style93 {
                         width: 203px;
                         text-align: right;
                         height: 39px;
                     }
                     .auto-style94 {
                         width: 203px;
                         text-align: right;
                         height: 40px;
                     }
                     .auto-style102 {
                         height: 64px;
                         width: 203px;
                     }
                     .auto-style103 {
                         height: 64px;
                     }
                     .auto-style104 {
                         width: 72px;
                         height: 83px;
                     }
                     .auto-style105 {
                         width: 203px;
                         text-align: right;
                         height: 83px;
                     }
                     .auto-style106 {
                         width: 1000px;
                         text-align: right;
                         height: 83px;
                     }
                     .auto-style107 {
                         width: 113px;
                         text-align: right;
                         height: 83px;
                     }
                     .auto-style108 {
                         width: 213px;
                         height: 83px;
                     }
                     .auto-style109 {
                         width: 172px;
                         height: 83px;
                     }
                     .auto-style110 {
                         height: 83px;
                     }
                     .auto-style111 {
                         width: 72px;
                         height: 88px;
                     }
                     .auto-style112 {
                         width: 203px;
                         text-align: right;
                         height: 88px;
                     }
                     .auto-style113 {
                         width: 1000px;
                         text-align: right;
                         height: 88px;
                     }
                     .auto-style114 {
                         width: 113px;
                         text-align: right;
                         height: 88px;
                     }
                     .auto-style115 {
                         width: 213px;
                         height: 88px;
                     }
                     .auto-style116 {
                         width: 172px;
                         height: 88px;
                     }
                     .auto-style117 {
                         height: 88px;
                     }
    </style>
<script type="text/javascript">
        function callBackFn(arg) {
            window.location.href = "StockOUT.aspx";
            return false;
        }
    </script>
       <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager2" runat="server"/>
       <h2 style="font-family: 'Century Gothic'; font-weight: bold;" class ="text-center">STOCK OUT</h2>
    <table class="auto-style83">
        <tr>
            <td class="auto-style7"></td>
            <td class="auto-style102">
          
            </td>
            <td class="auto-style74"></td>
            <td class="auto-style3"></td>
            <td class="auto-style5"></td>
            <td class="auto-style75"></td>
            <td class="auto-style103"></td>
        </tr>
        <tr>
            <td class="auto-style8"></td>
            <td class="auto-style93"> </td>
            <td class="auto-style2">
                <telerik:RadLabel ID="RadLabel2" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Service:</telerik:RadLabel>
            </td>
            <td class="auto-style58">
                <telerik:RadComboBox ID="Service" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Width="230px" Skin="Bootstrap" AutoPostBack="True">
                </telerik:RadComboBox>
            </td>
            <td class="auto-style10">
                </td>
            <td class="auto-style58">

            </td>
        </tr>
        <tr>
            <td class="auto-style104"></td>
            <td class="auto-style105"> </td>
            <td class="auto-style106">
                <telerik:RadLabel ID="RadLabel8" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Supply Items:</telerik:RadLabel>
            </td>
            <td class="auto-style107">
          
                <telerik:RadGrid ID="RadGrid2" runat="server" AutoGenerateColumns="False" 
        GroupPanelPosition="Top" Skin="Bootstrap" 
        style="font-family: 'Segoe UI'; font-size: medium; text-align: center" 
        Width="520px" AllowPaging="True" Font-Names="Century Gothic" Font-Size="Medium">

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
                <telerik:GridBoundColumn DataField="Quantity" 
                    FilterControlAltText="Filter column1 column" HeaderText="Quantity" 
                    ReadOnly="True" UniqueName="column1">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SupplyID" Display="False" FilterControlAltText="Filter column3 column" UniqueName="column3">
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
            </td>
            <td class="auto-style108">
                </td>
            <td class="auto-style109">
                </td>
            <td class="auto-style110">

                </td>
        </tr>
        <tr>
            <td class="auto-style111"></td>
            <td class="auto-style112"> </td>
            <td class="auto-style113">
                <telerik:RadLabel ID="RadLabel7" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Stock Items:</telerik:RadLabel>
            </td>
            <td class="auto-style114">
          
       <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" 
        GroupPanelPosition="Top" Skin="Bootstrap" 
        style="font-family: 'Segoe UI'; font-size: medium; text-align: center" 
        Width="1000px" AllowPaging="True" Font-Names="Century Gothic" Font-Size="Medium">

<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <AlternatingItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Century Gothic" Font-Size="Medium" />
        <MasterTableView>
            <Columns>
                <%--  <telerik:GridButtonColumn CommandName="Stock" 
                    FilterControlAltText="Filter column8 column" HeaderText="Stock OUT" 
                    UniqueName="column8" Text="Update" ButtonType="PushButton">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridButtonColumn>--%>
                <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">

                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblRowNumber" Text='<%# Container.DataSetIndex + 1 %>'></asp:Label>
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
                <telerik:GridBoundColumn DataField="SupplyID" Display="False" FilterControlAltText="Filter column3 column" UniqueName="column3">
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
            </td>
            <td class="auto-style115">
            </td>
            <td class="auto-style116">
                </td>
            <td class="auto-style117">

            </td>
        </tr>
        <tr>
            <td class="auto-style86">&nbsp;</td>
            <td class="auto-style94"> &nbsp;</td> 
            <td class="auto-style88">
                &nbsp;</td>
            <td class="auto-style89">
          
                <strong>
                <telerik:RadButton ID="RadButton1" runat="server" Font-Bold="True" Font-Names="Century Gothic" Height="33px" style="font-size: 16px;" Text="Stock OUT" Width="143px" Skin="Bootstrap" BorderColor="#666666" BorderStyle="Solid">
                </telerik:RadButton>
                </strong>
            </td>
            <td class="auto-style90">
                &nbsp;</td>
            <td class="auto-style91">
                &nbsp;</td>
            <td class="auto-style49">

                &nbsp;</td>
        </tr>
    </table>
     <br />
     <asp:Button ID="Button1" runat="server" 
                    style="font-family: 'Segoe UI'; font-size: medium;display:none;" Text="Add" Width="93px" 
                    Height="33px"/>
      <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button1" PopupControlID="ModalPanel"
                                CancelControlID="CloseButton" BackgroundCssClass="ModalBackground">
                        </asp:ModalPopupExtender>

     <asp:Panel ID="ModalPanel" runat="server" Width="719px" 
                    style="border: 3px solid Black; background-color:#FFFFFF; padding-top:10px; padding-left:10px;display:none;" 
                    Height="236px">
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

