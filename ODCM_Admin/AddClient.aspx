<%@ Page Title="Add Client" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="AddClient.aspx.vb" Inherits="AddClient" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
        function callBackFn(arg) {
            window.location.href = "Default.aspx";
            return false;
        }
    </script>
    <table  style="width:100%;">
        <tr>
            <td style="width: 84px">&nbsp;&nbsp;
            </td>
            <td style="width: 18%">&nbsp;</td>
            <td style="width: 266px">&nbsp;</td>
            <td style="width: 208px">&nbsp;</td>
            <td style="width: 302px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 50px">
                
            <td style="width: 337px"><strong>
                <telerik:RadLabel ID="RadLabel2" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    PATIENT INFORMATION</telerik:RadLabel>
                </strong></td>
            <td style="width: 266px">&nbsp;</td>
            <td style="width: 208px">&nbsp;</td>
            <td style="width: 302px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 84px; height: 37px;"></td>
            <td class="text-right" style="width: 337px; height: 37px;">
                <telerik:RadLabel ID="RadLabel1" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Last Name:</telerik:RadLabel>
            </td>
            <td style="width: 266px; height: 37px">
                <telerik:RadTextBox ID="Lastname" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
            </td>
            <td class="text-right" style="width: 208px; height: 37px;">
                <telerik:RadLabel ID="RadLabel7" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Sex:</telerik:RadLabel>
            </td>
            <td style="height: 37px; width: 302px;">
                <telerik:RadComboBox ID="Sex" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Width="230px" Skin="Bootstrap">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="Male" Value="Male" />
                        <telerik:RadComboBoxItem runat="server" Text="Female" Value="Female" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td style="height: 37px"></td>
        </tr>
        <tr>
            <td style="width: 84px; height: 37px;"></td>
            <td class="text-right" style="width: 337px; height: 37px;">
                <telerik:RadLabel ID="RadLabel3" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    First Name:</telerik:RadLabel>
            </td>
            <td style="width: 266px; height: 37px">
                <telerik:RadTextBox ID="Firstname" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
            </td>
            <td style="width: 208px; height: 37px;" class="text-right">
                <telerik:RadLabel ID="RadLabel8" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Nickname:</telerik:RadLabel>
            </td>
            <td style="width: 302px; height: 37px;">
                <telerik:RadTextBox ID="Nickname" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
            </td>
            <td style="height: 37px"></td>
        </tr>
        <tr>
            <td style="width: 84px">&nbsp;</td>
            <td class="text-right" style="width: 337px; height: 37px;">
                <telerik:RadLabel ID="RadLabel4" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Middle Name:</telerik:RadLabel>
            </td>
            <td style="width: 266px; height: 37px">
                <telerik:RadTextBox ID="Middlename" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel9" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Home No.:</telerik:RadLabel>
            </td>
            <td style="width: 302px">
                <telerik:RadTextBox ID="HomeNo" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 84px">&nbsp;</td>
            <td class="text-right" style="width: 337px; height: 37px;">
                <telerik:RadLabel ID="RadLabel5" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Birth Date:</telerik:RadLabel>
            </td>
            <td style="width: 266px; height: 37px">
                <telerik:RadDatePicker ID="RadDatePicker1" Runat="server" Culture="en-US" Font-Names="Century Gothic" Font-Overline="False" Font-Size="Medium" Skin="Bootstrap" Width="230px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" EnableKeyboardNavigation="True" Skin="Bootstrap"></Calendar>

<DateInput DisplayDateFormat="MM/dd/yyyy" DateFormat="MM/dd/yyyy" LabelWidth="40%">
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
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel10" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Office No.:</telerik:RadLabel>
            </td>
            <td style="width: 302px">
                <telerik:RadTextBox ID="OfficeNo" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
          <tr>
            <td style="width: 84px">&nbsp;</td>
            <td class="text-right" style="width: 337px; height: 37px;">
                <telerik:RadLabel ID="RadLabel6" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Age:</telerik:RadLabel>
            </td>
            <td style="width: 266px; height: 37px">
                <telerik:RadTextBox ID="Age" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel11" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Fax No.:</telerik:RadLabel>
              </td>
            <td style="width: 302px">
                <telerik:RadTextBox ID="FaxNo" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
              </td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td style="width: 84px">&nbsp;</td>
            <td class="text-right" style="width: 337px; height: 37px;">
                <telerik:RadLabel ID="RadLabel12" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Religion:</telerik:RadLabel>
            </td>
            <td style="width: 266px; height: 37px">
                <telerik:RadTextBox ID="Religion" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
            </td>
            <td style="width: 208px" class="text-right">
                &nbsp;</td>
            <td style="width: 302px">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td style="width: 84px">&nbsp;</td>
            <td class="text-right" style="width: 337px; height: 37px;">
                <telerik:RadLabel ID="RadLabel14" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Nationality:</telerik:RadLabel>
            </td>
            <td style="width: 266px; height: 37px">
                <telerik:RadTextBox ID="Nationality" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel15" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Email Address:</telerik:RadLabel>
              </td>
            <td style="width: 302px">
                <telerik:RadTextBox ID="EmailAddr" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
              </td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td style="width: 84px">&nbsp;</td>
            <td class="text-right" style="width: 337px; height: 37px;">
                <telerik:RadLabel ID="RadLabel16" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Home Address:</telerik:RadLabel>
            </td>
            <td style="width: 266px; height: 37px">
                <telerik:RadTextBox ID="HomeAddr" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel17" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Effective Date:</telerik:RadLabel>
              </td>
            <td style="width: 302px">
                <telerik:RadDatePicker ID="RadDatePicker2" Runat="server" Culture="en-US" Font-Names="Century Gothic" Font-Overline="False" Font-Size="Medium" Skin="Bootstrap" Width="230px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" EnableKeyboardNavigation="True" Skin="Bootstrap"></Calendar>

<DateInput DisplayDateFormat="MM/dd/yyyy" DateFormat="MM/dd/yyyy" LabelWidth="40%">
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
            <td>&nbsp;</td>
        </tr>
                 <tr>
            <td style="width: 84px">&nbsp;</td>
            <td class="text-right" style="width: 337px; height: 37px;">
                <telerik:RadLabel ID="RadLabel18" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Occupation:</telerik:RadLabel>
            </td>
            <td style="width: 266px; height: 37px">
                <telerik:RadTextBox ID="Occupation" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel19" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Dental Insurance:</telerik:RadLabel>
              </td>
            <td style="width: 302px">
                <telerik:RadTextBox ID="DentalInsurance" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
              </td>
            <td>&nbsp;</td>
        </tr>
                 <tr>
            <td style="width: 84px">&nbsp;</td>
            <td class="text-right" style="width: 337px; height: 37px; font-size: 16px;">
                <strong style="font-family: Century Gothic;">For Minors:</strong></td>
            <td style="width: 266px; height: 37px">
                &nbsp;</td>
            <td style="width: 208px" class="text-right">
                &nbsp;</td>
            <td style="width: 302px">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
                 <tr>
            <td style="width: 84px">&nbsp;</td>
            <td class="text-right" style="width: 337px; height: 37px;">
                <telerik:RadLabel ID="RadLabel20" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Guardian&#39;s Name:</telerik:RadLabel>
            </td>
            <td style="width: 266px; height: 37px">
                <telerik:RadTextBox ID="Guardian" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
            </td>
            <td style="width: 208px" class="text-right">
                <telerik:RadLabel ID="RadLabel21" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Occupation:</telerik:RadLabel>
              </td>
            <td style="width: 302px">
                <telerik:RadTextBox ID="GuardianOccup" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="29px" Skin="Bootstrap" Width="230px">
                </telerik:RadTextBox>
              </td>
            <td>&nbsp;</td>
        </tr>
                 <tr>
            <td style="width: 84px">&nbsp;</td>
            <td class="text-right" style="width: 337px; height: 37px;">
                &nbsp;</td>
            <td style="width: 266px; height: 37px">
                &nbsp;</td>
            <td style="width: 208px" class="text-right">
                &nbsp;</td>
            <td style="width: 302px">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
                 <tr>
            <td style="width: 84px; height: 52px;"></td>
            <td class="text-right" style="width: 337px; height: 52px;">
            </td>
            <td style="width: 266px; height: 52px">
            </td>
            <td style="width: 208px; height: 52px;">
                <strong>
                     <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" EnableShadow="true">
        </telerik:RadWindowManager>
                <telerik:RadButton ID="RadButton1" runat="server" Font-Bold="True" Font-Names="Century Gothic" Height="33px" style="font-size: 16px; left: 0px; top: 4px; margin-top: 0px" Text="Update" Width="143px" Skin="Bootstrap" BorderColor="#666666">
                </telerik:RadButton>
                </strong>
              </td>
            <td style="width: 302px; height: 52px;">
              </td>
            <td style="height: 52px"></td>
        </tr>
                 <tr>
            <td style="width: 84px">&nbsp;</td>
            <td class="text-right" style="width: 337px; height: 37px;">
                &nbsp;</td>
            <td style="width: 266px; height: 37px">
                &nbsp;</td>
            <td style="width: 208px" class="text-right">
                &nbsp;</td>
            <td style="width: 302px">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

</asp:Content>

