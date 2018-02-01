Imports System.Net
Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports System
Imports System.Configuration
Imports System.Data
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Xml.Linq
Partial Class AddClient
    Inherits System.Web.UI.Page
    Dim RowID As String



    Public Sub LoadClient()
        RowID = Page.Session("ID")
        SqlQuery("select lastname,firstname,middlename from clienttbl where clientid='" & RowID & "'")
        Lastname.Text = dtCommon.Rows(0).Item(0)
        Firstname.Text = dtCommon.Rows(0).Item(1)
        Middlename.Text = dtCommon.Rows(0).Item(2)
    End Sub

    Private Sub AddClient_Load(sender As Object, e As EventArgs) Handles Me.Load
        LoadClient()
        RadDatePicker1.SelectedDate = Date.Now
        RadDatePicker2.SelectedDate = Date.Now
    End Sub


    Public Sub send(ByVal uid As String, ByVal password As String, ByVal message As String, ByVal no As String)
        Dim myReq As HttpWebRequest = DirectCast(WebRequest.Create(("https://smsc.vianett.no/v3/send?username=" + uid + "&password=" + password + "&msgid=" + no + "&tel=" + no + "&msg=" & message)), HttpWebRequest)
        Dim myResp As HttpWebResponse = DirectCast(myReq.GetResponse(), HttpWebResponse)
        Dim respStreamReader As New System.IO.StreamReader(myResp.GetResponseStream())
        Dim responseString As String = respStreamReader.ReadToEnd()
        respStreamReader.Close()
        myResp.Close()
    End Sub

    Dim SMSVianettAccnt() As String

    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click
        SqlQuery("update clienttbl set birthdate='" & Format(RadDatePicker1.SelectedDate, "yyyy-MM-dd") & "',age='" & Age.Text & "',religion='" & Religion.Text & "',nationality='" & Nationality.Text & "',Address='" & HomeAddr.Text & "',Occupation='" & Occupation.Text & "',gender='" & Sex.Text & "',nickname='" & Nickname.Text & "',homeno='" & HomeNo.Text & "',officeno='" & OfficeNo.Text & "',faxno='" & FaxNo.Text & "',emailaddress='" & EmailAddr.Text & "',EffectiveDate='" & Format(RadDatePicker2.SelectedDate, "yyyy-MM-dd") & "',dentalinsurance='" & DentalInsurance.Text & "',guardian='" & Guardian.Text & "',guardianoccup='" & GuardianOccup.Text & "',isverified=1 where clientid='" & RowID & "'")
        RadWindowManager1.RadAlert("Information Updated Successfully.", 330, 180, "DENTCAST", "callBackFn", "/Images/Success.png")
        Response.Redirect("~/Default.aspx")


    End Sub
End Class
