<%@ Page Title="View Schedule" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Schedule.aspx.vb" Inherits="Schedule" %>
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
 
    <h2 style="font-family: 'Century Gothic'; font-weight: bold;" class ="text-center">PATIENT SCHEDULE</h2>
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
                    Service:</telerik:RadLabel></td>
            <td class="auto-style2">
                <telerik:RadComboBox ID="Service" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Width="230px" Skin="Bootstrap" AutoPostBack="True">
                   
                </telerik:RadComboBox>
            </td>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style6">
                <telerik:RadLabel ID="RadLabel2" runat="server" Skin="Bootstrap" style="font-size: large" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium">
                    Status:</telerik:RadLabel>
            </td>
            <td class="auto-style10">
                <telerik:RadComboBox ID="Status" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Width="230px" Skin="Bootstrap" AutoPostBack="True">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="Pending" Value="Pending" />
                        <telerik:RadComboBoxItem runat="server" Text="Approved" Value="Approved" />
                        <telerik:RadComboBoxItem runat="server" Text="Disapproved" Value="Disapproved" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td>
              
            </td>
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
         <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" AllowSorting="True" Width="90%"
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowAutomaticDeletes="True" OnNeedDataSource="RadGrid1_NeedDataSource" AllowPaging="True" runat="server" OnItemCreated="RadGrid_ItemCreated" OnUpdateCommand="RadGrid_ItemUpdated"
             AutoGenerateColumns="False" GroupPanelPosition="Top" Skin="Bootstrap" Font-Names="Century Gothic">
            <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

            <MasterTableView Width="100%" CommandItemDisplay="Top"
                DataKeyNames="ID" InsertItemDisplay="Top"
                InsertItemPageIndexAction="ShowItemOnFirstPage">
                <CommandItemSettings ShowAddNewRecordButton="false" />
                <Columns>
                     <telerik:GridTemplateColumn  HeaderStyle-Width="50px" FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                         <ItemTemplate>
                            <asp:Label runat="server" ID="lblRowNumber" Text='<%# Container.DataSetIndex+1 %>'></asp:Label>
                         </ItemTemplate>

                        <HeaderStyle Width="50px"></HeaderStyle>
                         <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                     </telerik:GridTemplateColumn>
                     <telerik:GridBoundColumn DataField="ID" UniqueName="ID" HeaderText="Reservation ID" Display="false">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="230px"/>
                    </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn UniqueName="Service" HeaderText="Service" ItemStyle-Width="240px">
                 
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "Service")%>
                        </ItemTemplate>

                 <EditItemTemplate>
                    <telerik:RadComboBox ID="List1" runat="server" RenderMode="Lightweight" Skin="Bootstrap" Width="185px"/>
                </EditItemTemplate>
                  <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </telerik:GridTemplateColumn>
             <telerik:GridTemplateColumn UniqueName="DateReserved" HeaderText="Date Reserved" ItemStyle-Width="240px">
                 
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "DateReserved")%>
                        </ItemTemplate>
                 
                 <EditItemTemplate>
                  <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Culture="en-US" Font-Names="Arial" Font-Overline="False" Font-Size="Medium" Skin="Bootstrap" Width="185px" DbSelectedDate='<%# Bind("DateReserved") %>'>
                    <Calendar EnableKeyboardNavigation="True" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Bootstrap">
                    </Calendar>
                </telerik:RadDatePicker>
                </EditItemTemplate>
                  <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </telerik:GridTemplateColumn>

            <telerik:GridTemplateColumn UniqueName="TimeReserved" HeaderText="Time Reserved" ItemStyle-Width="240px">
                 
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "TimeReserved")%>
                        </ItemTemplate>

                 <EditItemTemplate>
                        <telerik:RadTimePicker ID="RadTimePicker1" Runat="server" Culture="en-US" Font-Names="Arial" Font-Overline="False" Font-Size="Medium" Skin="Bootstrap" Width="185px" DbSelectedDate='<%# Bind("TimeReserved") %>'>
                </telerik:RadTimePicker>
                </EditItemTemplate>
                  <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </telerik:GridTemplateColumn>
                     <telerik:GridBoundColumn DataField="Remarks" UniqueName="Remarks" HeaderText="Remarks">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="230px"/>
                    </telerik:GridBoundColumn>

                    <telerik:GridEditCommandColumn>
                    </telerik:GridEditCommandColumn>

                    <telerik:GridButtonColumn ConfirmText="Delete this reservation?" ConfirmDialogType="RadWindow"
                        ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" ImageUrl ="../Images/delete2.png"/>
                </Columns>

                <EditFormSettings>
                    <EditColumn UniqueName="EditCommandColumn1"  FilterControlAltText="Filter EditCommandColumn1 column" ButtonType="ImageButton"></EditColumn>
                </EditFormSettings>
            </MasterTableView>
             <HeaderStyle Font-Names="Century Gothic" />
<FilterMenu RenderMode="Lightweight"></FilterMenu>
<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
             
        </telerik:RadGrid>

       <br /> 
       </div>
    </center>
  <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" Skin="Bootstrap" />
</asp:Content>

