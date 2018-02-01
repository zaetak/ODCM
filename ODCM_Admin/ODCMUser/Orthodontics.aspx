<%@ Page Title="Patient Diagnosis" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Orthodontics.aspx.vb" Inherits="Orthodontics" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <telerik:RadLabel ID="RadLabel2" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Large">
        PATIENT DIAGNOSIS
    </telerik:RadLabel>
    <br />
    <br />
<table  style="width:100%;">
        <tr>
            <td style="width: 71px; height: 37px;"></td>
            <td class="text-right" style="width: 273px; height: 37px;">
                <telerik:RadLabel ID="RadLabel4" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Teeth Number:</telerik:RadLabel>
            </td>
            <td style="width: 803px; height: 37px">
                <telerik:RadLabel ID="Teethid" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="False">
                    Last Name:</telerik:RadLabel>
            </td>
            <td style="height: 37px"></td>
        </tr>
        <tr>
            <td style="width: 71px; height: 37px;"></td>
            <td class="text-right" style="width: 273px; height: 37px;">
                <telerik:RadLabel ID="RadLabel5" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Patient Name:</telerik:RadLabel>
            </td>
            <td style="width: 803px; height: 37px">
                <telerik:RadLabel ID="PatientName" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap">
                    Last Name:</telerik:RadLabel>
            </td>
            <td style="height: 37px"></td>
        </tr>
        <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 273px; height: 37px;">
                <telerik:RadLabel ID="RadLabel6" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Date of Examination:</telerik:RadLabel>
            </td>
            <td style="width: 803px; height: 37px">
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
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 273px; height: 37px;">
                <telerik:RadLabel ID="RadLabel16" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Service</telerik:RadLabel>
            </td>
            <td style="width: 803px; height: 37px">
                <telerik:RadComboBox ID="Service" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Width="230px" Skin="Bootstrap">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="Male" Value="Male" />
                        <telerik:RadComboBoxItem runat="server" Text="Female" Value="Female" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 71px; height: 104px;"></td>
            <td class="text-right" style="width: 273px; height: 104px;">
                <telerik:RadLabel ID="RadLabel10" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Chief Complaint</telerik:RadLabel>
            </td>
            <td style="width: 803px; height: 104px">
                <telerik:RadTextBox ID="chiefcomplaint" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="81px" Skin="Bootstrap" Width="361px" TextMode="MultiLine">
                </telerik:RadTextBox>
            </td>
            <td style="height: 104px"></td>
        </tr>
          <tr>
            <td style="width: 71px; height: 36px;"></td>
            <td class="text-right" style="width: 273px; height: 104px;">
                <telerik:RadLabel ID="RadLabel11" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Past Dental History:</telerik:RadLabel>
            </td>
             <td style="width: 803px; height: 104px">
                <telerik:RadTextBox ID="dentalhistory" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="81px" Skin="Bootstrap" Width="361px" TextMode="MultiLine">
                </telerik:RadTextBox>
            </td>
            <td style="height: 36px"></td>
        </tr>
         <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 273px; height: 37px;">
                <telerik:RadLabel ID="RadLabel12" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Under any medication now?</telerik:RadLabel>
             </td>
            <td style="width: 803px; height: 37px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton1" runat="server" Text="Yes" GroupName="Medication" Font-Names="Century Gothic"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton2" runat="server" Text="No" GroupName="Medication" Font-Names="Century Gothic" />
             </td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 273px; height: 37px;">
                <telerik:RadLabel ID="RadLabel13" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Congenital Abnormalities?</telerik:RadLabel>
             </td>
             <td style="width: 803px; height: 37px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton3" runat="server" Text="Yes" GroupName="Congenital" Font-Names="Century Gothic"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton4" runat="server" Text="No" GroupName="Congenital" Font-Names="Century Gothic" />
             </td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 273px; height: 37px;">
                <telerik:RadLabel ID="RadLabel1" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Temporo Mandibular Joint Problems?</telerik:RadLabel>
             </td>
             <td style="width: 803px; height: 37px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton5" runat="server" Text="Yes" GroupName="Temporo" Font-Names="Century Gothic"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton6" runat="server" Text="No" GroupName="Temporo" Font-Names="Century Gothic" />
             </td>
            <td>&nbsp;</td>
        </tr>
                 <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 273px; height: 37px;">
                <telerik:RadLabel ID="RadLabel14" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Oral Hygiene:</telerik:RadLabel>
                     </td>
            <td style="width: 803px; height: 37px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton7" runat="server" Text="Excellent" GroupName="Hygiene" Font-Names="Century Gothic"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton8" runat="server" Text="Fair" GroupName="Hygiene" Font-Names="Century Gothic" />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton9" runat="server" Text="Poor" GroupName="Hygiene" Font-Names="Century Gothic"/>
            </td>
            <td>&nbsp;</td>
        </tr>
                 <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 273px; height: 37px; font-size: 16px;">
                <telerik:RadLabel ID="RadLabel15" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Gingival Tissues:</telerik:RadLabel>
                     </td>
            <td style="width: 803px; height: 37px">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton10" runat="server" Text="Thick" GroupName="Gingival" Font-Names="Century Gothic"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton11" runat="server" Text="Thin" GroupName="Gingival" Font-Names="Century Gothic" />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton12" runat="server" Text="Normal" GroupName="Gingival" Font-Names="Century Gothic"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton13" runat="server" Text="Receding" GroupName="Gingival" Font-Names="Century Gothic" />
            </td>
            <td>&nbsp;</td>
        </tr>
                 <tr>
            <td style="width: 71px">&nbsp;</td>
             <td class="text-right" style="width: 273px; height: 104px;">
                <telerik:RadLabel ID="RadLabel3" runat="server" Font-Names="Century Gothic" Font-Size="Medium" Skin="Bootstrap" Font-Bold="True">
                    Diagnosis:</telerik:RadLabel>
            </td>
             <td style="width: 803px; height: 104px">
                <telerik:RadTextBox ID="RadTextBox2" Runat="server" Font-Names="Century Gothic" Font-Size="Medium" Height="81px" Skin="Bootstrap" Width="361px" TextMode="MultiLine">
                </telerik:RadTextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
                 <tr>
            <td style="width: 71px; height: 67px;"></td>
             <td class="text-right" style="width: 273px; height: 67px;">
            </td>
             <td style="width: 803px; height: 67px">
                   <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <telerik:RadButton ID="RadButton1" runat="server" Font-Bold="True" Font-Names="Century Gothic" Height="33px" style="font-size: 16px; left: 0px; top: 4px; margin-top: 0px" Text="Submit" Width="143px" Skin="Bootstrap" Visible="False">
                </telerik:RadButton>
                </strong></td>
            <td style="height: 67px"></td>
        </tr>
                 <tr>
            <td style="width: 71px; height: 40px;">&nbsp;</td>
             <td class="text-right" style="width: 273px; height: 40px;">
                 &nbsp;</td>
             <td style="width: 803px; height: 40px">
                 &nbsp;</td>
            <td style="height: 40px">&nbsp;</td>
        </tr>
                 <tr>
            <td style="width: 71px">&nbsp;</td>
            <td class="text-right" style="width: 273px; height: 37px;">
                &nbsp;</td>
            <td style="width: 803px; height: 37px">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
                 </table>
    <br />
</asp:Content>

