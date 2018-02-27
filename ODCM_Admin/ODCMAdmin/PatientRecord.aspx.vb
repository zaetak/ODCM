Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports Microsoft.VisualBasic
Partial Class PatientRecord
    Inherits System.Web.UI.Page

    Public Sub GetClientInformation()
        SqlQuery("select lastname,firstname,middlename,DATE_FORMAT(birthdate,'%M %d, %Y'),age,gender,religion,nationality,guardian,nickname,occupation,address,phonenumber,emailaddress,homeno,officeno,dentalinsurance,faxno,DATE_FORMAT(effectivedate,'%M %d, %Y'),guardianoccup from clienttbl where clientid='" & ID & "'")
        If dtCommon.Rows(0).Item(0) = Nothing Then
            LastName.Text = "NULL"
        Else
            LastName.Text = dtCommon.Rows(0).Item(0)
        End If

        If dtCommon.Rows(0).Item(1) = Nothing Then
            FirstName.Text = "NULL"
        Else
            FirstName.Text = dtCommon.Rows(0).Item(10)
        End If

        If dtCommon.Rows(0).Item(2) = Nothing Then
            MiddleName.Text = "NULL"
        Else
            MiddleName.Text = dtCommon.Rows(0).Item(2)
        End If

        If dtCommon.Rows(0).Item(3) = Nothing Then
            Birthdate.Text = "NULL"
        Else
            Birthdate.Text = dtCommon.Rows(0).Item(3)
        End If

        If dtCommon.Rows(0).Item(4) = Nothing Then
            Age.Text = "NULL"
        Else
            Age.Text = dtCommon.Rows(0).Item(4)
        End If

        If dtCommon.Rows(0).Item(5) = Nothing Then
            Sex.Text = "NULL"
        Else
            Sex.Text = dtCommon.Rows(0).Item(5)
        End If

        If dtCommon.Rows(0).Item(6) = Nothing Then
            Religion.Text = "NULL"
        Else
            Religion.Text = dtCommon.Rows(0).Item(6)
        End If

        If dtCommon.Rows(0).Item(7) = Nothing Then
            Nationality.Text = "NULL"
        Else
            Nationality.Text = dtCommon.Rows(0).Item(7)
        End If

        If dtCommon.Rows(0).Item(8) = Nothing Then
            Guardian.Text = "NULL"
        Else
            Guardian.Text = dtCommon.Rows(0).Item(8)
        End If

        If dtCommon.Rows(0).Item(9) = Nothing Then
            Nickname.Text = "NULL"
        Else
            Nickname.Text = dtCommon.Rows(0).Item(9)
        End If

        If dtCommon.Rows(0).Item(10) = Nothing Then
            Occupation.Text = "NULL"
        Else
            Occupation.Text = dtCommon.Rows(0).Item(10)
        End If

        If dtCommon.Rows(0).Item(11) = Nothing Then
            HomeAddr.Text = "NULL"
        Else
            HomeAddr.Text = dtCommon.Rows(0).Item(11)
        End If

        If dtCommon.Rows(0).Item(12) = Nothing Then
            PhoneNumber.Text = "NULL"
        Else
            PhoneNumber.Text = dtCommon.Rows(0).Item(12)
        End If

        If dtCommon.Rows(0).Item(13) = Nothing Then
            EmailAddr.Text = "NULL"
        Else
            EmailAddr.Text = dtCommon.Rows(0).Item(13)
        End If

        If dtCommon.Rows(0).Item(14) = Nothing Then
            HomeNo.Text = "NULL"
        Else
            HomeNo.Text = dtCommon.Rows(0).Item(14)
        End If

        If dtCommon.Rows(0).Item(15) = Nothing Then
            OfficeNo.Text = "NULL"
        Else
            OfficeNo.Text = dtCommon.Rows(0).Item(15)
        End If

        If dtCommon.Rows(0).Item(16) = Nothing Then
            DentalInsurance.Text = "NULL"
        Else
            DentalInsurance.Text = dtCommon.Rows(0).Item(16)
        End If

        If dtCommon.Rows(0).Item(17) = Nothing Then
            FaxNo.Text = "NULL"
        Else
            FaxNo.Text = dtCommon.Rows(0).Item(17)
        End If

        If dtCommon.Rows(0).Item(18) = Nothing Then
            EffectiveDate.Text = "NULL"
        Else
            EffectiveDate.Text = dtCommon.Rows(0).Item(18)
        End If

        If dtCommon.Rows(0).Item(19) = Nothing Then
            GOccupation.Text = "NULL"
        Else
            GOccupation.Text = dtCommon.Rows(0).Item(19)
        End If

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
            Dim ID As String = item("TeethID").Text
            Page.Session("Red") = True
            Page.Session("teethid") = ID
            Page.Session("viewonly") = True
            Response.Redirect("PatientRecord.aspx")

            'ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=55"

        End If
    End Sub
    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource
        RadGrid1.DataSource = Nothing
        SqlQuery("Select id,teethid,service,diagnosis,DATE_FORMAT(examdate,'%M %d, %Y') as examdate from patientteeth where clientid='" & ID & "' order by examdate  desc")
        RadGrid1.DataSource = dtCommon
    End Sub

    Dim ID As Integer

    Public Sub GetClientID()
        ID = Page.Session("ClientID")
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        GetClientID()
        If Page.Session("Red") = True Then
            Page.Session("Red") = False
            ifrm1.Attributes.Add("src", "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=" & Page.Session("teethid") & "")
            ModalPopupExtender1.Show()
        End If
        If IsPostBack = False Then

            GetClientInformation()
            'teeth55.ToolTip = "try lang po."
        End If
    End Sub
    Private Sub sample55_ServerClick(sender As Object, e As EventArgs) Handles sample55.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=55"
        ModalPopupExtender1.Show()
    End Sub

    Private Sub sample11_ServerClick(sender As Object, e As EventArgs) Handles sample11.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=11"
        ModalPopupExtender1.Show()

    End Sub

    Private Sub sample12_ServerClick(sender As Object, e As EventArgs) Handles sample12.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=12"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample13_ServerClick(sender As Object, e As EventArgs) Handles sample13.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=13"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample14_ServerClick(sender As Object, e As EventArgs) Handles sample14.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=14"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample15_ServerClick(sender As Object, e As EventArgs) Handles sample15.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=15"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample16_ServerClick(sender As Object, e As EventArgs) Handles sample16.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=16"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample17_ServerClick(sender As Object, e As EventArgs) Handles sample17.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=17"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample18_ServerClick(sender As Object, e As EventArgs) Handles sample18.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=18"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample21_ServerClick(sender As Object, e As EventArgs) Handles sample21.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=21"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample22_ServerClick(sender As Object, e As EventArgs) Handles sample22.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=22"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample23_ServerClick(sender As Object, e As EventArgs) Handles sample23.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=23"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample24_ServerClick(sender As Object, e As EventArgs) Handles sample24.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=24"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample25_ServerClick(sender As Object, e As EventArgs) Handles sample25.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=25"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample26_ServerClick(sender As Object, e As EventArgs) Handles sample26.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=26"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample27_ServerClick(sender As Object, e As EventArgs) Handles sample27.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=27"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample28_ServerClick(sender As Object, e As EventArgs) Handles sample28.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=28"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample31_ServerClick(sender As Object, e As EventArgs) Handles sample31.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=31"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample32_ServerClick(sender As Object, e As EventArgs) Handles sample32.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=32"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample33_ServerClick(sender As Object, e As EventArgs) Handles sample33.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=33"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample34_ServerClick(sender As Object, e As EventArgs) Handles sample34.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=34"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample35_ServerClick(sender As Object, e As EventArgs) Handles sample35.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=35"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample36_ServerClick(sender As Object, e As EventArgs) Handles sample36.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=36"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample37_ServerClick(sender As Object, e As EventArgs) Handles sample37.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=37"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample38_ServerClick(sender As Object, e As EventArgs) Handles sample38.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=38"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample41_ServerClick(sender As Object, e As EventArgs) Handles sample41.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=41"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample42_ServerClick(sender As Object, e As EventArgs) Handles sample42.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=42"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample43_ServerClick(sender As Object, e As EventArgs) Handles sample43.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=43"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample44_ServerClick(sender As Object, e As EventArgs) Handles sample44.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=44"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample45_ServerClick(sender As Object, e As EventArgs) Handles sample45.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=45"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample46_ServerClick(sender As Object, e As EventArgs) Handles sample46.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=46"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample47_ServerClick(sender As Object, e As EventArgs) Handles sample47.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=47"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample48_ServerClick(sender As Object, e As EventArgs) Handles sample48.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=48"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample51_ServerClick(sender As Object, e As EventArgs) Handles sample51.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=51"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample52_ServerClick(sender As Object, e As EventArgs) Handles sample52.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=52"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample53_ServerClick(sender As Object, e As EventArgs) Handles sample53.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=53"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample54_ServerClick(sender As Object, e As EventArgs) Handles sample54.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=54"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample61_ServerClick(sender As Object, e As EventArgs) Handles sample61.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=61"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample62_ServerClick(sender As Object, e As EventArgs) Handles sample62.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=62"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample63_ServerClick(sender As Object, e As EventArgs) Handles sample63.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=63"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample64_ServerClick(sender As Object, e As EventArgs) Handles sample64.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=64"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample65_ServerClick(sender As Object, e As EventArgs) Handles sample65.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=65"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample71_ServerClick(sender As Object, e As EventArgs) Handles sample71.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=71"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample72_ServerClick(sender As Object, e As EventArgs) Handles sample72.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=72"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample73_ServerClick(sender As Object, e As EventArgs) Handles sample73.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=73"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample74_ServerClick(sender As Object, e As EventArgs) Handles sample74.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=74"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample75_ServerClick(sender As Object, e As EventArgs) Handles sample75.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=75"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample81_ServerClick(sender As Object, e As EventArgs) Handles sample81.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=81"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample82_ServerClick(sender As Object, e As EventArgs) Handles sample82.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=82"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample83_ServerClick(sender As Object, e As EventArgs) Handles sample83.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=83"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample84_ServerClick(sender As Object, e As EventArgs) Handles sample84.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=84"
            ModalPopupExtender1.Show()

    End Sub

    Private Sub sample85_ServerClick(sender As Object, e As EventArgs) Handles sample85.ServerClick
        Page.Session("viewonly") = False
        ifrm1.Src = "~/ODCMAdmin/TeethRecord.aspx?PatientTeethID=85"
            ModalPopupExtender1.Show()

    End Sub
End Class
