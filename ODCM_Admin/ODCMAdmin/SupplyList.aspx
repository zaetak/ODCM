<%@ Page Title="Supply List" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="SupplyList.aspx.vb" Inherits="SupplyList" %>
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
               width: 312px;
           }


           .auto-style11 {
            height: 41px;
            width: 312px;
        }

    </style>
   <script type="text/javascript">
        function callBackFn(arg) {
            window.location.href = "SupplyList.aspx";
            return false;
        }
    </script>
     <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager2" runat="server" EnableShadow="true">
        </telerik:RadWindowManager>
        <h2 style="font-family: 'Century Gothic'; font-weight: bold;" class ="text-center">SUPPLY LIST</h2>
    <table style="width:100%; height: 76px;">
        <tr>
            <td class="auto-style7"></td>
            <td style="width: 88px; height: 41px;">
          
            </td>
            <td class="auto-style1"></td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
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
              
                   <strong>
                <telerik:RadButton ID="RadButton1" runat="server" Font-Bold="True" Font-Names="Century Gothic" Height="25px" style="font-size: 16px; margin-top: 0px" Text="Print" Width="117px" Skin="Bootstrap" BorderColor="#666666" CssClass="auto-style2" Target="_blank">
                </telerik:RadButton>
                </strong>
              
            </td>
        </tr>
    </table>
     <br />

   <telerik:RadNotification RenderMode="Lightweight" ID="RadNotification1" runat="server" Height="140px" 
            Animation="Fade" EnableRoundedCorners="true" EnableShadow="true" AutoCloseDelay="0" Width="450px"
            Position="BottomRight" OffsetX="-50" OffsetY="-50" ShowCloseButton="true" 
            VisibleOnPageLoad="false" LoadContentOn="EveryShow" KeepOnMouseOver="false"
          Title="DENTCAST" Font-Names="Century Gothic">
        </telerik:RadNotification>

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
         <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" AllowSorting="True" Width="100%"
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowAutomaticDeletes="True" OnNeedDataSource="RadGrid1_NeedDataSource" runat="server" OnItemCreated="RadGrid_ItemCreated" OnUpdateCommand="RadGrid_ItemUpdated" OnInsertCommand="RadGrid_InsertCommand"
             AutoGenerateColumns="False" GroupPanelPosition="Top" Skin="Bootstrap" Font-Names="Century Gothic" Font-Size="Medium">
            <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
            <MasterTableView Width="100%" CommandItemDisplay="Top"
                DataKeyNames="SupplyID" InsertItemDisplay="Top"
                InsertItemPageIndexAction="ShowItemOnFirstPage">
                <Columns>
                    <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">

                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblRowNumber" Text='<%# Container.DataSetIndex+1 %>'></asp:Label>
                         </ItemTemplate>

                        <HeaderStyle Width="70px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />

                    </telerik:GridTemplateColumn>
                     <telerik:GridBoundColumn DataField="SupplyID" UniqueName="SupplyID" HeaderText="Product Number" Display="false">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="15%"/>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="InvoiceNo" 
                            HeaderText="Invoice Number" 
                            UniqueName="InvoiceNo">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle"  Width="13%"/>
                        </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="Supplier" 
                   HeaderText="Supplier" 
                    UniqueName="Supplier">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"  Width="15%"/>
                </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Item Name" 
                   HeaderText="Item Name" 
                    UniqueName="ItemName">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"  Width="15%"/>
                </telerik:GridBoundColumn>

                    

             <telerik:GridTemplateColumn UniqueName="UOM" HeaderText="UOM" ItemStyle-Width="190px">
                 
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "UOM")%>
                        </ItemTemplate>

                 <EditItemTemplate>
                    <telerik:RadComboBox ID="List1" runat="server" RenderMode="Lightweight" Skin="Bootstrap" Width="185px" AllowCustomText="true"/>
                </EditItemTemplate>
                  <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"  Width="15%"/>
                    </telerik:GridTemplateColumn>

            <telerik:GridTemplateColumn UniqueName="Category" HeaderText="Category" ItemStyle-Width="240px">
                 
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "Category")%>
                        </ItemTemplate>

                 <EditItemTemplate>
                    <telerik:RadComboBox ID="List2" runat="server" RenderMode="Lightweight" Skin="Bootstrap" Width="185px"/>
                </EditItemTemplate>
                  <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"  Width="15%"/>
                    </telerik:GridTemplateColumn>


                    <telerik:GridTemplateColumn UniqueName="ExpiDate" HeaderText="Expiration Date" ItemStyle-Width="300px">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "ExpiDate")%>
                        </ItemTemplate>
                 
                        <EditItemTemplate>
                            <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Culture="en-US" Font-Names="Arial" Font-Overline="False" Font-Size="Medium" Skin="Bootstrap" Width="185px" DbSelectedDate='<%# Bind("ExpiDate") %>'>
                                <Calendar EnableKeyboardNavigation="True" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Bootstrap" runat="server">
                                </Calendar>
                            </telerik:RadDatePicker>
                        </EditItemTemplate>
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"  Width="15%"/>
                    </telerik:GridTemplateColumn>


                <telerik:GridBoundColumn DataField="Quantity" 
                 HeaderText="Quantity" 
                   UniqueName="Quantity">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle"  Width="10%"/>
                </telerik:GridBoundColumn>

                    

                    <telerik:GridEditCommandColumn>
                    </telerik:GridEditCommandColumn>


                </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
            </MasterTableView>
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>



<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
        </telerik:RadGrid>

       <br /> 
       </div>
    </center>
     <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" Skin="Bootstrap" />

</asp:Content>

