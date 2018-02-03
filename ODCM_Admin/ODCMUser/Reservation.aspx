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
     </style>
    <br />
    <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" EnableShadow="true">
                            </telerik:RadWindowManager>
    <h2 style="font-family: 'Century Gothic'; font-weight: bold;" class ="text-center">SCHEDULE AN APPOINTMENT</h2>
    <telerik:RadScheduler RenderMode="Lightweight" runat="server" ID="RadScheduler1" Skin="Bootstrap" FirstDayOfWeek="Monday" LastDayOfWeek="Saturday"
            SelectedView="WeekView" Height="865px" AllowEdit="false" AllowDelete="false" AllowInsert="true" DayEndTime="20:00:00" EnableDescriptionField="true">
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
    <asp:Panel ID="ModalPanel" runat="server" Height="439px" style="border: 3px solid Black; background-color:#FFFFFF;display:none;" Width="569px">
           <table class="nav-justified" style="height: 434px">
        <tr>
            <td style="width: 162px; height: 31px;"></td>
            <td style="width: 304px; height: 31px;"></td>
            <td style="height: 31px"></td>
            <td style="height: 31px"></td>
        </tr>
        <tr>
            <td style="width: 162px; height: 56px;" class="text-right">
                <telerik:RadLabel ID="RadLabel1" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    Service:
                </telerik:RadLabel>
            </td>
            <td style="width: 304px; height: 56px;">
                <telerik:RadComboBox ID="Service" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Width="280px" ZIndex="10000001">
                </telerik:RadComboBox>
            </td>
            <td style="height: 56px"></td>
            <td style="height: 56px"></td>
        </tr>
        <tr>
            <td style="width: 162px; height: 63px;" class="text-right">
                <telerik:RadLabel ID="RadLabel3" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    Date:
                </telerik:RadLabel>
            </td>
            <td style="width: 304px; height: 63px">
                <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Skin="Bootstrap" Width="280px" SelectedDate='<%#RadScheduler1.SelectedDate %>' ZIndex="10000001">
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
            <td style="height: 63px"></td>
            <td style="height: 63px"></td>
        </tr>
        <tr>
            <td style="width: 162px; height: 60px;" class="text-right">
                <telerik:RadLabel ID="RadLabel4" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    Time:
                </telerik:RadLabel>
            </td>
            <td style="width: 304px; height: 60px">
                <telerik:RadTimePicker ID="RadTimePicker1" Runat="server" Culture="en-US" Font-Names="Arial" Font-Overline="False" Font-Size="Medium" Skin="Bootstrap" Width="280px" ZIndex="10000001">
                    <TimeView EndTime="20:00:00" Interval="03:00:00" StartTime="08:00:00">
                    </TimeView>
                </telerik:RadTimePicker>
            </td>
            <td style="height: 60px"></td>
            <td style="height: 60px"></td>
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
</asp:Content>

