<%@ Page Title="Add Reservation" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Reservation.aspx.vb" Inherits="Reservation" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <script type="text/javascript">
        function callBackFn(arg) {
            window.location.href = "Reservation.aspx";
            return false;
        }
    </script>
     <style type="text/css">
    .ModalBackground
{
    background-color:Gray;
    filter: alpha(opacity=70);
    opacity: 0.7;
    z-index: 10000001;
 
}
         .auto-style1 {
             font-size: x-large;
             font-family: "Century Gothic";
         }
         .auto-style2 {
             width: 100%;
             height: 142px;
         }
         .auto-style3 {
             text-align: right;
             width: 162px;
             height: 46px;
         }
         .auto-style7 {
             height: 46px;
         }
         .auto-style10 {
             height: 47px;
             text-align: center;
         }
         .auto-style11 {
             text-align: right;
             width: 162px;
             height: 53px;
         }
         .auto-style12 {
             width: 304px;
             height: 53px;
         }
         .auto-style14 {
             height: 53px;
         }
         .auto-style15 {
             text-align: right;
             width: 162px;
             height: 54px;
         }
         .auto-style16 {
             width: 304px;
             height: 54px;
         }
         .auto-style17 {
             height: 54px;
         }
         .auto-style18 {
             text-align: right;
             width: 162px;
             height: 56px;
         }
         .auto-style19 {
             width: 304px;
             height: 56px;
         }
         .auto-style20 {
             height: 56px;
         }
     </style>
    <br />
    <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" EnableShadow="true">
                            </telerik:RadWindowManager>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span class="auto-style1">Schedule an appointment.
    </span></strong>
    </p>
    <telerik:RadScheduler RenderMode="Lightweight" runat="server" ID="RadScheduler1" Skin="Bootstrap" FirstDayOfWeek="Monday"
            SelectedView="WeekView" Height="865px" AllowEdit="False" AllowDelete="False" DayEndTime="20:00:00" EnableDescriptionField="True" RowHeight="30px" ShowFooter="False" ShowViewTabs="False">
            <WeekView UserSelectable="true" />
            <DayView UserSelectable="true" />
            <MultiDayView UserSelectable="false" />
            <TimelineView UserSelectable="false" />
            <MonthView UserSelectable="false" />
         <%--   <ResourceStyles>
                <telerik:ResourceStyleMapping Type="Calendar" Text="Schedule" ApplyCssClass="rsCategoryBlue"></telerik:ResourceStyleMapping>
            </ResourceStyles>--%>
            <%--<TimeSlotContextMenuSettings EnableDefault="true"></TimeSlotContextMenuSettings>--%>
            <%--<AppointmentContextMenuSettings EnableDefault="true"></AppointmentContextMenuSettings>--%>
        </telerik:RadScheduler>

     <asp:Button ID="Button2" runat="server" style="font-family: 'Segoe UI'; font-size: medium;display:none" Text="Add" Width="93px" Height="33px"/> 
      <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button2" PopupControlID="ModalPanel"
                                CancelControlID="btnClose" BackgroundCssClass="ModalBackground">
                </asp:ModalPopupExtender>
    <asp:Panel ID="ModalPanel" runat="server" Height="439px" style="border: 3px solid Black; background-color:#FFFFFF;" Width="569px">
           <table class="nav-justified" style="height: 434px">
        <tr>
            <td class="auto-style18">
                <telerik:RadLabel ID="RadLabel1" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    Service:
                </telerik:RadLabel>
            </td>
            <td class="auto-style19">
                <telerik:RadComboBox ID="Service" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Width="280px" ZIndex="10000001" AutoPostBack="True" EmptyMessage="Select Service">
                </telerik:RadComboBox>
            </td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
        </tr>
        <tr>
            <td class="auto-style11">
                <telerik:RadLabel ID="RadLabel3" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    Date:
                </telerik:RadLabel>
            </td>
            <td class="auto-style12">
                <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Skin="Bootstrap" Width="280px" SelectedDate='<%#RadScheduler1.SelectedDate %>' ZIndex="10000001" Enabled="False">
                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Bootstrap" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                    </Calendar>
                    <DateInput DateFormat="MM/dd/yyyy" DisplayDateFormat="MM/dd/yyyy" LabelWidth="40%">
                        <EmptyMessageStyle Resize="None" />
                        <ReadOnlyStyle Resize="None" />
                        <FocusedStyle Resize="None" />
                        <DisabledStyle Resize="None" />
                        <InvalidStyle Resize="None" />
                        <HoveredStyle Resize="None" />
                        <EnabledStyle Resize="None" />
                    </DateInput>
                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                </telerik:RadDatePicker>
            </td>
            <td class="auto-style14"></td>
            <td class="auto-style14"></td>
        </tr>
        <tr>
            <td class="auto-style15">
                <telerik:RadLabel ID="RadLabel4" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    Service Duration:
                </telerik:RadLabel>
            </td>
            <td class="auto-style16">
                <telerik:RadLabel ID="lblservice" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                   
                </telerik:RadLabel>
                <telerik:RadLabel ID="lblservice1" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    Hours
                </telerik:RadLabel>
            </td>
            <td class="auto-style17"></td>
            <td class="auto-style17"></td>
        </tr>
               <tr>
                   <td class="text-right" style="width: 162px; height: 60px;">
                       <telerik:RadLabel ID="RadLabel7" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                           Time:
                       </telerik:RadLabel>
                   </td>
                   <td style="width: 304px; height: 60px">
                       <telerik:RadLabel ID="lbltime" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                           
                       </telerik:RadLabel>
                       <telerik:RadLabel ID="lbltime0" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                           To
                       </telerik:RadLabel>
                       <telerik:RadLabel ID="lbltime1" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                          
                       </telerik:RadLabel>
                   </td>
                   <td style="height: 60px">&nbsp;</td>
                   <td style="height: 60px">&nbsp;</td>
               </tr>
        <tr>
            <td style="width: 162px; height: 123px;" class="text-right">
                <telerik:RadLabel ID="RadLabel5" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    Remarks:
                </telerik:RadLabel>
            </td>
            <td style="width: 304px; height: 123px">
                <telerik:RadTextBox ID="RadTextBox1" Runat="server" Font-Names="Century Gothic" Height="100px" Skin="Bootstrap" TextMode="MultiLine" Width="280px">
                </telerik:RadTextBox>
            </td>
            <td style="height: 123px"></td>
            <td style="height: 123px"></td>
        </tr>
        <tr>
            <td style="height: 107px;" class="text-right" colspan="4"><strong>
                <center>
                    <telerik:RadButton ID="RadButton1" runat="server" Font-Bold="True" Font-Names="Century Gothic" Height="33px" Skin="Bootstrap" style="font-size: 16px; left: 0px; top: 4px; margin-top: 0px" Text="Add Schedule" Width="143px">
                    </telerik:RadButton>
                    <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <telerik:RadButton ID="btnClose" runat="server" Font-Bold="True" Font-Names="Century Gothic" Height="33px" Skin="Bootstrap" style="font-size: 16px; left: 0px; top: 4px; margin-top: 0px" Text="Cancel" Width="143px">
                    </telerik:RadButton>
                    </strong>
                </center>
                </strong></td>
        </tr>
    </table>    
    </asp:Panel>
   
       <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="Button2" PopupControlID="Panel1"
                                CancelControlID="RadButton3" BackgroundCssClass="ModalBackground">
                </asp:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" Height="165px" style="border: 3px solid Black; background-color:#FFFFFF;display:none;" Width="569px">
           <table class="auto-style2">
        <tr>
            <td class="auto-style10" colspan="2">
                <telerik:RadLabel ID="RadLabel2" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    Clinic is in DAY OFF today.
                </telerik:RadLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <telerik:RadLabel ID="RadLabel6" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    Remarks:
                </telerik:RadLabel>
            </td>
            <td class="auto-style7">
                <telerik:RadLabel ID="lblremarks" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    Remarks:
                </telerik:RadLabel>
            </td>
        </tr>
        <tr>
            <td class="text-right" colspan="2"><strong>
                <center>
                     <strong>
                    <telerik:RadButton ID="RadButton3" runat="server" Font-Bold="True" Font-Names="Century Gothic" Height="33px" Skin="Bootstrap" style="font-size: 16px; left: 0px; top: 4px; margin-top: 0px" Text="Close" Width="143px">
                    </telerik:RadButton>
                    </strong>
                </center>
                </strong></td>
        </tr>
    </table>    
    </asp:Panel>
</asp:Content>

