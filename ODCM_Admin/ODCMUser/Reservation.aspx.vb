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
        SqlQuery("insert into reservationtbl(clientid,datereserved,timereserved,serviceid,remarks,status) values('" & userid & "','" & Format(RadDatePicker1.SelectedDate, "yyyy-MM-dd") & "','" & RadTimePicker1.SelectedTime.ToString & "','" & ServiceID & "','" & RadTextBox1.Text & "','Pending')")
        RadWindowManager1.RadAlert("Reservation Added Successfully.", 330, 180, "DENTCAST", "callBackFn", "/Images/Success.png")
    End Sub

    Dim TimeSlot As String() = New String() {8, 11, 14, 17}
    Dim TimeSlot1 As List(Of String) = TimeSlot.ToList()
    Dim TimeSlot2 As String() = {"0"}


    Public Sub ReservationLookUp()
        SqlQuery("select CAST(DATE_FORMAT(timereserved, '%H') AS UNSIGNED)  from reservationtbl where datereserved='" & Format(RadDatePicker1.SelectedDate, "yyyy-MM-dd") & "' AND (status = 'Pending' or status= 'Approved')")
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            For y As Integer = 0 To TimeSlot1.Count - 1
                If dtCommon.Rows(x).Item(0) = TimeSlot1(y) Then
                    TimeSlot1.Remove(TimeSlot(y))
                    Exit For
                End If
            Next
        Next
        Dim count As Integer
        For z As Integer = 0 To TimeSlot1.Count
            Try
                TimeSlot2 = TimeSlot2.Concat({TimeSlot1(z) & "," & TimeSlot1(z) & ",0,0"}).ToArray
                count = count + 1
            Catch ex As Exception
                TimeSlot2 = TimeSlot2.Concat({"-,-,-,-"}).ToArray
            End Try
        Next
        If count = 4 Then
            RadTimePicker1.TimeView.CustomTimeValues = New String() {TimeSlot2(1), TimeSlot2(2), TimeSlot2(3), TimeSlot2(4)}
        ElseIf count = 3 Then
            RadTimePicker1.TimeView.CustomTimeValues = New String() {TimeSlot2(1), TimeSlot2(2), TimeSlot2(3)}
        ElseIf count = 2 Then
            RadTimePicker1.TimeView.CustomTimeValues = New String() {TimeSlot2(1), TimeSlot2(2)}
        ElseIf count = 1 Then
            RadTimePicker1.TimeView.CustomTimeValues = New String() {TimeSlot2(1)}
        ElseIf count = 0 Then
            RadTimePicker1.TimeView.Enabled = False
        End If
        RadTimePicker1.TimeView.Columns = 4

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

    Private Sub RadDatePicker1_SelectedDateChanged(sender As Object, e As SelectedDateChangedEventArgs) Handles RadDatePicker1.SelectedDateChanged
        ReservationLookUp()
    End Sub

    Public Sub LoadSchedule()
        RadScheduler1.DataStartField = Format(Date.Now, "yyyy-MM-dd")
        RadScheduler1.DataEndField = Format(Date.Now, "yyyy-MM-dd")
        RadScheduler1.DataKeyField = "Key"
        RadScheduler1.DataSubjectField = "Subject"
        RadScheduler1.DataDescriptionField = "Description"
        SqlQuery("select a.serviceoffered,CONCAT(b.datereserved,' ',b.timereserved),b.remarks from servicestbl a,reservationtbl b where a.id=b.serviceid")
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            Dim mAppointment = New Appointment
            mAppointment.Subject = dtCommon.Rows(x).Item(0)
            mAppointment.Description = dtCommon.Rows(x).Item(2)
            mAppointment.ToolTip = dtCommon.Rows(x).Item(2)
            Dim DStart, DEnd As Date
            DStart = Format(CDate(dtCommon.Rows(x).Item(1)), "yyyy-MM-dd HH:mm:ss")
            DEnd = DStart.AddHours(3)
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
        ReservationLookUp()
        RadTimePicker1.Focus()
        ModalPopupExtender1.Show()
    End Sub
End Class
