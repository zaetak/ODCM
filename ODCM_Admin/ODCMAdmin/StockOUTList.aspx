<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="StockOUTList.aspx.vb" Inherits="StockOUTList" %>
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


           .auto-style3 {
               height: 41px;
               width: 662px;
           }
           .auto-style7 {
               height: 41px;
               width: 22px;
           }
           

                     .auto-style74 {
                         height: 41px;
                         width: 91px;
                     }
                     .auto-style83 {
                         width: 100%;
                         height: 76px;
                     }
                     .auto-style88 {
                         width: 91px;
                         text-align: right;
                         height: 40px;
                     }
                     .auto-style89 {
                         width: 662px;
                         text-align: left;
                         height: 40px;
                     }
                     .auto-style92 {
                         height: 41px;
                         width: 17px;
                     }
                       .auto-style95 {
                           width: 22px;
                           height: 104px;
                       }
                       .auto-style96 {
                           width: 17px;
                           text-align: right;
                           height: 104px;
                       }
                       .auto-style97 {
                           width: 91px;
                           text-align: right;
                           height: 104px;
                       }
                       .auto-style98 {
                           width: 662px;
                           text-align: right;
                           height: 104px;
                       }
                       .auto-style102 {
                           width: 17px;
                           text-align: right;
                           height: 56px;
                       }
                       .auto-style103 {
                           width: 91px;
                           text-align: right;
                           height: 56px;
                       }
                       .auto-style105 {
                           height: 56px;
                           width: 22px;
                       }
                       .auto-style109 {
                           height: 56px;
                           width: 662px;
                       }
                       .auto-style115 {
                           width: 17px;
                           text-align: right;
                           height: 40px;
                       }
                       .auto-style116 {
                           width: 22px;
                           height: 40px;
                       }
                       </style>
    <script type="text/javascript">
        function callBackFn(arg) {
            window.location.href = "StockOUTList.aspx";
            return false;
        }
    </script>
    <table class="auto-style83">
        <tr>
            <td class="auto-style7"></td>
            <td class="auto-style92">
          
            </td>
            <td class="auto-style74"></td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style105"></td>
            <td class="auto-style102"> </td>
            <td class="auto-style103">
                <telerik:RadLabel ID="RadLabel2" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Service:</telerik:RadLabel>
            </td>
            <td class="auto-style109">
                <telerik:RadComboBox ID="Service" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Width="334px" Skin="Bootstrap" AutoPostBack="True">
                   
                </telerik:RadComboBox>
             </td>
        </tr>
        <tr>
            <td class="auto-style95"></td>
            <td class="auto-style96"> </td>
            <td class="auto-style97">
                <telerik:RadLabel ID="RadLabel7" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Supplies:</telerik:RadLabel>
            </td>
            <td class="auto-style98">
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
                <div class="text-left">
         <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" AllowSorting="True" Width="99%"
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowAutomaticDeletes="True" OnNeedDataSource="RadGrid1_NeedDataSource" AllowPaging="True" runat="server" OnItemCreated="RadGrid_ItemCreated" OnInsertCommand="RadGrid_InsertCommand" OnDeleteCommand="RadGrid_ItemDeleted"
             AutoGenerateColumns="False" GroupPanelPosition="Top" Skin="Bootstrap" Font-Names="Century Gothic" Font-Size="Medium">
             <FooterStyle Font-Names="Century Gothic" Font-Size="Medium" />
             <HeaderStyle Font-Names="Century Gothic" Font-Size="Medium" />
             <CommandItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
             <ActiveItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
             <ItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
            <PagerStyle Mode="NextPrevAndNumeric" Font-Names="Century Gothic" Font-Size="Medium"></PagerStyle>
             <AlternatingItemStyle Font-Names="Century Gothic" Font-Size="Medium" />
            <MasterTableView Width="100%" CommandItemDisplay="Top"
                DataKeyNames="ItemName" InsertItemDisplay="Top"
                InsertItemPageIndexAction="ShowItemOnFirstPage">
                <Columns>
                              <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">

                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblRowNumber" Text='<%# Container.DataSetIndex+1 %>'></asp:Label>
                                 </ItemTemplate>

                                <HeaderStyle Width="50px"></HeaderStyle>
                                 <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                              </telerik:GridTemplateColumn>
                              <telerik:GridBoundColumn DataField="ID" 
                   HeaderText="ID" 
                    UniqueName="ID" Display="false">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn DataField="ItemName" UniqueName="ItemName" HeaderText="Item Name" ItemStyle-Width="240px">
                 
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "ItemName")%>
                        </ItemTemplate>

                 <EditItemTemplate>
                    <telerik:RadComboBox ID="List1" runat="server" RenderMode="Lightweight" Skin="Bootstrap" Width="185px" AllowCustomText="true"/>
                </EditItemTemplate>
                  <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </telerik:GridTemplateColumn>
          
                <telerik:GridBoundColumn DataField="Quantity" 
                 HeaderText="Quantity" 
                   UniqueName="Quantity">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </telerik:GridBoundColumn>
                    <telerik:GridButtonColumn ConfirmText="Delete on the list?" ConfirmDialogType="RadWindow" HeaderText="Delete" ItemStyle-Width="170px"
                        ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" ImageUrl="~/Images/Delete.png">
                          <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </telerik:GridButtonColumn>
                             </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
            </MasterTableView>
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>


<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
        </telerik:RadGrid>
                </div>
       <br /> 
            </td>
        </tr>
        <tr>
            <td class="auto-style116">&nbsp;</td>
            <td class="auto-style115"> &nbsp;</td>
            <td class="auto-style88">
                &nbsp;</td>
            <td class="auto-style89">
                <center>
                </center>
            </td>
        </tr>
    </table>
    <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" Skin="Bootstrap" />
    <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager2" runat="server"/>

</asp:Content>

