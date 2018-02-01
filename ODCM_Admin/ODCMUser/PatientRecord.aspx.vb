Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports Microsoft.VisualBasic
Partial Class PatientRecord
    Inherits System.Web.UI.Page

    Public Sub GetClientInformation()
        SqlQuery("select lastname,firstname,middlename,DATE_FORMAT(birthdate,'%M %d, %Y'),age,gender,religion,nationality,guardian,nickname,occupation,address,phonenumber,emailaddress,homeno,officeno,dentalinsurance,faxno,DATE_FORMAT(effectivedate,'%M %d, %Y'),guardianoccup from clienttbl where clientid='" & ID & "'")
        LastName.Text = dtCommon.Rows(0).Item(0).ToString
        FirstName.Text = dtCommon.Rows(0).Item(1).ToString
        MiddleName.Text = dtCommon.Rows(0).Item(2).ToString
        Birthdate.Text = dtCommon.Rows(0).Item(3).ToString
        Age.Text = dtCommon.Rows(0).Item(4).ToString
        Sex.Text = dtCommon.Rows(0).Item(5).ToString
        Religion.Text = dtCommon.Rows(0).Item(6).ToString
        Nationality.Text = dtCommon.Rows(0).Item(7).ToString
        Guardian.Text = dtCommon.Rows(0).Item(8).ToString
        Nickname.Text = dtCommon.Rows(0).Item(9).ToString
        Occupation.Text = dtCommon.Rows(0).Item(10).ToString
        HomeAddr.Text = dtCommon.Rows(0).Item(11).ToString
        PhoneNumber.Text = dtCommon.Rows(0).Item(12).ToString
        EmailAddr.Text = dtCommon.Rows(0).Item(13).ToString
        HomeNo.Text = dtCommon.Rows(0).Item(14).ToString
        OfficeNo.Text = dtCommon.Rows(0).Item(15).ToString
        DentalInsurance.Text = dtCommon.Rows(0).Item(16).ToString
        FaxNo.Text = dtCommon.Rows(0).Item(17).ToString
        EffectiveDate.Text = dtCommon.Rows(0).Item(18).ToString
        GOccupation.Text = dtCommon.Rows(0).Item(19).ToString
        If Val(Age.Text) > 7 Then
            Permanent.Visible = True
            Temporary.Visible = False
        Else
            Permanent.Visible = False
            Temporary.Visible = True
        End If
    End Sub
    Private Sub RadGrid1_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGrid1.ItemDataBound
        'If TypeOf e.Item Is GridDataItem Then
        '    Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
        '    TryCast(dataItem("column8").Controls(0), Button).CssClass = "MyButton"
        'End If
    End Sub
    Private Sub RadGrid1_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGrid1.ItemCommand
        If e.CommandName = "View" Then
            Dim item As GridDataItem = CType(e.Item, GridDataItem)
            Dim ID As String = item("ID").Text
            Session("PatientID") = ID
            Response.Redirect("~/ODMCUser/Orthodontics.aspx")
        End If
    End Sub
    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource
        RadGrid1.DataSource = Nothing
        SqlQuery("select id,teethid,service,diagnosis,DATE_FORMAT(examdate,'%M %d, %Y') as examdate from patientteeth where clientid='" & ID & "' order by examdate  desc")
        RadGrid1.DataSource = dtCommon
    End Sub

    Dim ID As Integer

    Public Sub GetClientID()
        ID = Page.Session("LoginID")
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack = False Then
            GetClientID()
            GetClientInformation()
            'teeth55.ToolTip = "try lang po."
        End If
    End Sub
End Class
