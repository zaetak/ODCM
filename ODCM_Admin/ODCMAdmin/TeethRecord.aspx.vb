Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Partial Class ODCMAdmin_TeethRecord
    Inherits System.Web.UI.Page
    Public Sub LoadPatientTeethInfo()
        PTeethID = Request.QueryString("PatientTeethID")
        SqlQuery("select a.teethid,concat(b.lastname,', ',b.firstname,' ',b.middlename) as name,a.service,DATE_FORMAT(a.examdate,'%m/%d/%Y'),a.chiefcomplaint,a.dentalhistory,a.medication,a.congenital,a.temporo,a.oralhygiene,a.gingival,a.diagnosis from patientteeth a, clienttbl b where a.clientid=b.clientid and a.clientid='" & UID & "' and a.teethid='" & PTeethID & "'")
        If dtCommon.Rows.Count > 0 Then
            Teethid.Text = dtCommon.Rows(0).Item(0).ToString
            PatientName.Text = dtCommon.Rows(0).Item(1).ToString
            Service.Text = dtCommon.Rows(0).Item(2).ToString
            RadDatePicker1.SelectedDate = CDate(dtCommon.Rows(0).Item(3))
            chiefcomplaint.Text = dtCommon.Rows(0).Item(4).ToString
            dentalhistory.Text = dtCommon.Rows(0).Item(5).ToString
            If dtCommon.Rows(0).Item(6) = "Yes" Then
                RadioButton1.Checked = True
                RadioButton2.Checked = False
            Else
                RadioButton1.Checked = False
                RadioButton2.Checked = True
            End If
            If dtCommon.Rows(0).Item(7) = "Yes" Then
                RadioButton3.Checked = True
                RadioButton4.Checked = False
            Else
                RadioButton3.Checked = False
                RadioButton4.Checked = True
            End If
            If dtCommon.Rows(0).Item(8) = "Yes" Then
                RadioButton5.Checked = True
                RadioButton6.Checked = False
            Else
                RadioButton5.Checked = False
                RadioButton6.Checked = True
            End If
            If dtCommon.Rows(0).Item(9) = "Excellent" Then
                RadioButton7.Checked = True
                RadioButton8.Checked = False
                RadioButton9.Checked = False
            ElseIf dtCommon.Rows(0).Item(9) = "Fair" Then
                RadioButton7.Checked = False
                RadioButton8.Checked = True
                RadioButton9.Checked = False
            ElseIf dtCommon.Rows(0).Item(9) = "Poor" Then
                RadioButton7.Checked = False
                RadioButton8.Checked = False
                RadioButton9.Checked = True
            End If
            If dtCommon.Rows(0).Item(10) = "Thick" Then
                RadioButton10.Checked = True
                RadioButton11.Checked = False
                RadioButton12.Checked = False
                RadioButton13.Checked = False
            ElseIf dtCommon.Rows(0).Item(10) = "Thin" Then
                RadioButton10.Checked = False
                RadioButton11.Checked = True
                RadioButton12.Checked = False
                RadioButton13.Checked = False
            ElseIf dtCommon.Rows(0).Item(10) = "Normal" Then
                RadioButton10.Checked = False
                RadioButton11.Checked = False
                RadioButton12.Checked = True
                RadioButton13.Checked = False
            ElseIf dtCommon.Rows(0).Item(10) = "Receding" Then
                RadioButton10.Checked = False
                RadioButton11.Checked = False
                RadioButton12.Checked = False
                RadioButton13.Checked = True
            End If
            RadTextBox2.Text = dtCommon.Rows(0).Item(11).ToString

        End If
    End Sub

    Public Sub LoadService()
        SqlQuery("select serviceoffered from servicestbl order by serviceoffered")
        Service.Items.Clear()
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            Service.Items.Add(dtCommon.Rows(x).Item(0).ToString)
        Next
    End Sub

    Dim medication, congenital, temporo, oralhygiene, gingival As String
    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click
        SqlQuery("insert into patientteeth(clientid,teethid,service,examdate,diagnosis,chiefcomplaint,dentalhistory,medication,congenital,temporo,oralhygiene,gingival) values('" & UID & "','" & Teethid.Text & "','" & Service.Text & "','" & Format(RadDatePicker1.SelectedDate, "yyyy-MM-dd") & "','" & RadTextBox2.Text & "','" & chiefcomplaint.Text & "','" & dentalhistory.Text & "','" & medication & "','" & congenital & "','" & temporo & "','" & oralhygiene & "','" & gingival & "')")
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Added Successfully.'); window.location='" + Request.ApplicationPath + "ODCMUser/PatientRecord.aspx';", True)
    End Sub

    Dim PTeethID, UID As String

    Public Sub Clear()
        UserID = Page.Session("LoginID")
        SqlQuery("Select concat(lastname,', ',firstname,' ',middlename) as name from clienttbl where clientid='" & UserID & "'")
        Teethid.Text = Page.Session("teethid")
        PatientName.Text = dtCommon.Rows(0).Item(0).ToString
        Service.Text = Nothing
        RadDatePicker1.SelectedDate = Date.Now
        chiefcomplaint.Text = Nothing
        dentalhistory.Text = Nothing

        RadioButton1.Checked = False
        RadioButton2.Checked = False
        RadioButton3.Checked = False
        RadioButton4.Checked = False
        RadioButton5.Checked = False
        RadioButton6.Checked = False
        RadioButton7.Checked = False
        RadioButton8.Checked = False
        RadioButton10.Checked = False
        RadioButton11.Checked = False
        RadioButton12.Checked = False
        RadioButton13.Checked = False
        RadioButton9.Checked = False
        RadTextBox2.Text = Nothing
    End Sub

    Private Sub Orthodontics_Load(sender As Object, e As EventArgs) Handles Me.Load
        UID = Page.Session("ClientID")
        If Page.Session("viewonly") = True Then
            LoadPatientTeethInfo()
            RadButton1.Visible = False
        ElseIf Page.Session("viewonly") = False Then
            Clear()
            RadButton1.Visible = True
        End If
        If IsPostBack = False Then
            LoadService()

            'If Request.QueryString("PatientTeethID") <> Nothing Then
            '    LoadPatientTeethInfo()
            '    'RadButton1.Visible = False
            'Else
            '    'RadButton1.Visible = True
            'End If
            'If Request.QueryString("PatientTeethID") <> Nothing Then
            '    Teethid.Text = Request.QueryString("PatientTeethID")
            '    Clear()
            'End If
        End If
    End Sub

    Private Sub RadioButton1_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton1.CheckedChanged
        If RadioButton1.Checked = True Then
            medication = "Yes"
        End If
    End Sub

    Private Sub RadioButton2_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton2.CheckedChanged
        If RadioButton2.Checked = True Then
            medication = "No"
        End If
    End Sub
    Private Sub RadioButton3_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton3.CheckedChanged
        If RadioButton3.Checked = True Then
            congenital = "Yes"
        End If
    End Sub

    Private Sub RadioButton4_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton4.CheckedChanged
        If RadioButton4.Checked = True Then
            congenital = "No"
        End If
    End Sub

    Private Sub RadioButton5_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton5.CheckedChanged
        If RadioButton5.Checked = True Then
            temporo = "Yes"
        End If
    End Sub

    Private Sub RadioButton6_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton6.CheckedChanged
        If RadioButton6.Checked = True Then
            temporo = "No"
        End If
    End Sub

    Private Sub RadioButton7_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton7.CheckedChanged
        If RadioButton7.Checked = True Then
            oralhygiene = "Excellent"
        End If
    End Sub

    Private Sub RadioButton8_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton8.CheckedChanged
        If RadioButton8.Checked = True Then
            oralhygiene = "Fair"
        End If
    End Sub

    Private Sub RadioButton9_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton9.CheckedChanged
        If RadioButton9.Checked = True Then
            oralhygiene = "Poor"
        End If
    End Sub

    Private Sub RadioButton10_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton10.CheckedChanged
        If RadioButton10.Checked = True Then
            gingival = "Thick"
        End If
    End Sub
    Private Sub RadioButton11_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton11.CheckedChanged
        If RadioButton11.Checked = True Then
            gingival = "Thin"
        End If
    End Sub

    Private Sub RadioButton12_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton12.CheckedChanged
        If RadioButton12.Checked = True Then
            gingival = "Normal"
        End If
    End Sub

    Private Sub RadioButton13_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton13.CheckedChanged
        If RadioButton13.Checked = True Then
            gingival = "Receding"
        End If
    End Sub
End Class
