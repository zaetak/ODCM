Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports Telerik.Web.UI.Calendar

Partial Class Reservation
    Inherits System.Web.UI.Page
    Public Sub LoadService()
        SqlQuery("select serviceoffered from servicestbl order by serviceoffered")
        Service.Items.Clear()
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            Service.Items.Add(dtCommon.Rows(x).Item(0).ToString)
        Next
    End Sub

    Private Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click
        Dim user As String = Page.User.Identity.Name.ToString
        SqlQuery("select clientid from clienttbl where username='" & user & "'")
        Dim userid As String = dtCommon.Rows(0).Item(0).ToString
        SqlQuery("select id from servicestbl where serviceoffered='" & Service.Text & "'")
        Dim ServiceID As String = dtCommon.Rows(0).Item(0).ToString
        SqlQuery("insert into reservationtbl(clientid,datereserved,timereserved,serviceid,remarks,status) values('" & userid & "','" & Format(RadDatePicker1.SelectedDate, "yyyy-MM-dd") & "','" & lbltime.Text & "','" & ServiceID & "','" & RadTextBox1.Text & "','Pending')")
        RadWindowManager1.RadAlert("Reservation Added Successfully.", 330, 180, "DENTCAST", "callBackFn", "/Images/Success.png")
    End Sub

    Private Sub Reservation_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If

        If IsPostBack = False Then
            LoadService()
            LoadSchedule()
        End If
    End Sub



    Public Sub LoadSchedule()
        RadScheduler1.DataStartField = Format(Date.Now, "yyyy-MM-dd")
        RadScheduler1.DataEndField = Format(Date.Now, "yyyy-MM-dd")
        RadScheduler1.DataKeyField = "Key"
        RadScheduler1.DataSubjectField = "Subject"
        RadScheduler1.DataDescriptionField = "Description"
        SqlQuery("select a.serviceoffered,CONCAT(b.datereserved,' ',b.timereserved),b.remarks,a.hours from servicestbl a,reservationtbl b where a.id=b.serviceid")
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            Dim mAppointment = New Appointment
            mAppointment.Subject = dtCommon.Rows(x).Item(0)
            mAppointment.Description = dtCommon.Rows(x).Item(2)
            mAppointment.ToolTip = dtCommon.Rows(x).Item(2)
            Dim DStart, DEnd As Date
            DStart = Format(CDate(dtCommon.Rows(x).Item(1)), "yyyy-MM-dd HH:mm:ss")
            DEnd = DStart.AddHours(dtCommon.Rows(x).Item(3))
            mAppointment.Start = DStart
            mAppointment.End = DEnd
            mAppointment.BackColor = Drawing.Color.DarkViolet
            mAppointment.Font.Name = "Century Gothic"
            mAppointment.Font.Bold = True
            RadScheduler1.InsertAppointment(mAppointment)
            RadScheduler1.Font.Name = "Century Gothic"
        Next
    End Sub

    Private Sub RadScheduler1_FormCreating(sender As Object, e As SchedulerFormCreatingEventArgs) Handles RadScheduler1.FormCreating
        e.Cancel = True
        RadDatePicker1.SelectedDate = e.Appointment.Start
        lbltime.Text = Nothing
        lblservice1.Text = Nothing
        lbltime.Text = e.Appointment.Start.Hour.ToString("00") & ":" & e.Appointment.Start.Minute.ToString("00")
        RadTextBox1.Focus()
        SqlQuery("select remarks from dayofftbl where dateoff='" & Format(RadDatePicker1.SelectedDate, "yyyy-MM-dd") & "'")
        If dtCommon.Rows.Count > 0 Then
            lblremarks.Text = dtCommon.Rows(0).Item(0)
            ModalPopupExtender2.Show()
        Else
            ModalPopupExtender1.Show()
        End If
    End Sub

    Private Sub Service_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Service.SelectedIndexChanged
        SqlQuery("select hours from servicestbl where serviceoffered='" & Service.Text & "'")
        lblservice.Text = dtCommon.Rows(0).Item(0)
        lblservice1.Text = "Hours"
        Dim a As DateTime
        a = Convert.ToDateTime(lbltime.Text)
        lbltime1.Text = Format(a.AddHours(lblservice.Text), "HH:mm")
        ModalPopupExtender1.Show()
    End Sub
End Class
