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
    'Private Sub RadGrid1_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGrid1.ItemCommand
    '    If e.CommandName = "View" Then
    '        Dim item As GridDataItem = CType(e.Item, GridDataItem)
    '        Dim ID As String = item("ID").Text
    '        'Session("PatientID") = ID
    '        'Response.Redirect("~/ODMCUser/Orthodontics.aspx")
    '    End If
    'End Sub
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
        GetClientID()
        If IsPostBack = False Then

            GetClientInformation()
            'teeth55.ToolTip = "try lang po."
        End If
    End Sub
    Private Sub sample55_ServerClick(sender As Object, e As EventArgs) Handles sample55.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='55' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=55"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample11_ServerClick(sender As Object, e As EventArgs) Handles sample11.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='11' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=11"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample12_ServerClick(sender As Object, e As EventArgs) Handles sample12.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='12' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=12"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample13_ServerClick(sender As Object, e As EventArgs) Handles sample13.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='13' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=13"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample14_ServerClick(sender As Object, e As EventArgs) Handles sample14.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='14' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=14"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample15_ServerClick(sender As Object, e As EventArgs) Handles sample15.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='15' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=15"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample16_ServerClick(sender As Object, e As EventArgs) Handles sample16.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='16' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=16"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample17_ServerClick(sender As Object, e As EventArgs) Handles sample17.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='17' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=17"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample18_ServerClick(sender As Object, e As EventArgs) Handles sample18.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='18' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=18"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample21_ServerClick(sender As Object, e As EventArgs) Handles sample21.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='21' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=21"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample22_ServerClick(sender As Object, e As EventArgs) Handles sample22.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='22' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=22"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample23_ServerClick(sender As Object, e As EventArgs) Handles sample23.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='23' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=23"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample24_ServerClick(sender As Object, e As EventArgs) Handles sample24.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='24' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=24"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample25_ServerClick(sender As Object, e As EventArgs) Handles sample25.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='25' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=25"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample26_ServerClick(sender As Object, e As EventArgs) Handles sample26.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='26' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=26"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample27_ServerClick(sender As Object, e As EventArgs) Handles sample27.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='27' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=27"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample28_ServerClick(sender As Object, e As EventArgs) Handles sample28.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='28' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=28"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample31_ServerClick(sender As Object, e As EventArgs) Handles sample31.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='31' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=31"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample32_ServerClick(sender As Object, e As EventArgs) Handles sample32.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='32' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=32"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample33_ServerClick(sender As Object, e As EventArgs) Handles sample33.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='33' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=33"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample34_ServerClick(sender As Object, e As EventArgs) Handles sample34.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='34' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=34"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample35_ServerClick(sender As Object, e As EventArgs) Handles sample35.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='35' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=35"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample36_ServerClick(sender As Object, e As EventArgs) Handles sample36.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='36' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=36"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample37_ServerClick(sender As Object, e As EventArgs) Handles sample37.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='37' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=37"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample38_ServerClick(sender As Object, e As EventArgs) Handles sample38.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='38' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=38"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample41_ServerClick(sender As Object, e As EventArgs) Handles sample41.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='41' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=41"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample42_ServerClick(sender As Object, e As EventArgs) Handles sample42.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='42' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=42"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample43_ServerClick(sender As Object, e As EventArgs) Handles sample43.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='43' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=43"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample44_ServerClick(sender As Object, e As EventArgs) Handles sample44.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='44' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=44"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample45_ServerClick(sender As Object, e As EventArgs) Handles sample45.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='45' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=45"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample46_ServerClick(sender As Object, e As EventArgs) Handles sample46.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='46' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=46"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample47_ServerClick(sender As Object, e As EventArgs) Handles sample47.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='47' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=47"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample48_ServerClick(sender As Object, e As EventArgs) Handles sample48.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='48' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=48"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample51_ServerClick(sender As Object, e As EventArgs) Handles sample51.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='51' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=51"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample52_ServerClick(sender As Object, e As EventArgs) Handles sample52.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='52' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=52"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample53_ServerClick(sender As Object, e As EventArgs) Handles sample53.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='53' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=53"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample54_ServerClick(sender As Object, e As EventArgs) Handles sample54.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='54' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=54"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample61_ServerClick(sender As Object, e As EventArgs) Handles sample61.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='61' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=61"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample62_ServerClick(sender As Object, e As EventArgs) Handles sample62.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='62' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=62"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample63_ServerClick(sender As Object, e As EventArgs) Handles sample63.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='63' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=63"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample64_ServerClick(sender As Object, e As EventArgs) Handles sample64.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='64' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=64"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample65_ServerClick(sender As Object, e As EventArgs) Handles sample65.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='65' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=65"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample71_ServerClick(sender As Object, e As EventArgs) Handles sample71.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='71' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=71"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample72_ServerClick(sender As Object, e As EventArgs) Handles sample72.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='72' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=72"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample73_ServerClick(sender As Object, e As EventArgs) Handles sample73.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='73' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=73"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample74_ServerClick(sender As Object, e As EventArgs) Handles sample74.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='74' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=74"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample75_ServerClick(sender As Object, e As EventArgs) Handles sample75.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='75' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=75"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample81_ServerClick(sender As Object, e As EventArgs) Handles sample81.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='81' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=81"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample82_ServerClick(sender As Object, e As EventArgs) Handles sample82.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='82' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=82"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample83_ServerClick(sender As Object, e As EventArgs) Handles sample83.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='83' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=83"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample84_ServerClick(sender As Object, e As EventArgs) Handles sample84.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='84' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=84"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub

    Private Sub sample85_ServerClick(sender As Object, e As EventArgs) Handles sample85.ServerClick
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.teethid='85' and a.clientid='" & ID & "'")
        If dtCommon.Rows.Count > 0 Then
            ifrm1.Src = "~/ODCMUser/TeethRecord.aspx?PatientTeethID=85"
            ModalPopupExtender1.Show()
        Else
            RadWindowManager2.RadAlert("No records found.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
        End If
    End Sub
End Class
