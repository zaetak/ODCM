Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports System.Drawing
Imports Microsoft.VisualBasic
Imports System
Imports System.Collections
Imports Telerik.Web.UI.Calendar

Partial Class Schedule
    Inherits System.Web.UI.Page
    Dim userID As Integer
    Dim ID, Remarks As GridTextBoxColumnEditor
    Dim ServiceX, DateReserved, TimeReserved As GridTemplateColumnEditor
    Dim Service1 As RadComboBox
    Dim DateReserved1 As RadDatePicker
    Dim TimeReserved1 As RadTimePicker


    Protected Sub RadGrid_ItemCreated(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid1.ItemCreated

        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If Not (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                ID = TryCast(manager.GetColumnEditor("ID"), GridTextBoxColumnEditor)
                Remarks = TryCast(manager.GetColumnEditor("Remarks"), GridTextBoxColumnEditor)
                ServiceX = CType(manager.GetColumnEditor("Service"), GridTemplateColumnEditor)
                DateReserved = CType(manager.GetColumnEditor("DateReserved"), GridTemplateColumnEditor)
                TimeReserved = CType(manager.GetColumnEditor("TimeReserved"), GridTemplateColumnEditor)
                ID.TextBoxControl.Enabled = False
                Service1 = item.FindControl("List1")
                DateReserved1 = item.FindControl("RadDatePicker1")
                TimeReserved1 = item.FindControl("RadTimePicker1")
                SqlQuery("select serviceoffered from servicestbl order by serviceoffered")
                Service1.Items.Clear()
                Service1.Items.Add("--Please Select--")
                For x As Integer = 0 To dtCommon.Rows.Count - 1
                    Service1.Items.Add(dtCommon.Rows(x).Item(0).ToString)
                Next
                Service1.Text = "--Please Select--"

                ReservationLookUp(DateReserved1)
                DateReserved1.Attributes.Add("selecteddatechanged", ReservationLookUp(DateReserved1))
            End If
        End If

    End Sub



    Protected Sub RadGrid_ItemDeleted(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.DeleteCommand
        Dim item As GridDataItem = CType(e.Item, GridDataItem)
        Dim a As String = item("ID").Text
        SqlQuery("delete from reservationtbl where id='" & a & "'")
        RadGrid1.MasterTableView.ClearEditItems()
        RadGrid1.Rebind()
        Response.Redirect("~/ODCMUser/Schedule.aspx")
    End Sub
    Dim counter As Integer = 0
    Protected Sub RadGrid_ItemUpdated(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.EditCommand
        Dim ID, Remarks As GridTextBoxColumnEditor
        Dim Service, DateReserved, TimeReserved As GridTemplateColumnEditor
        Dim Service1 As RadComboBox
        Dim DateReserved1 As RadDatePicker
        Dim TimeReserved1 As RadTimePicker
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If Not (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                ID = TryCast(manager.GetColumnEditor("ID"), GridTextBoxColumnEditor)
                Remarks = TryCast(manager.GetColumnEditor("Remarks"), GridTextBoxColumnEditor)
                Service = CType(manager.GetColumnEditor("Service"), GridTemplateColumnEditor)
                DateReserved = CType(manager.GetColumnEditor("DateReserved"), GridTemplateColumnEditor)
                TimeReserved = CType(manager.GetColumnEditor("TimeReserved"), GridTemplateColumnEditor)
                ID.TextBoxControl.Enabled = False
                Service1 = item.FindControl("List1")
                DateReserved1 = item.FindControl("RadDatePicker1")
                TimeReserved1 = item.FindControl("RadTimePicker1")
                SqlQuery("select serviceoffered from servicestbl order by serviceoffered")
                Service1.Items.Clear()
                Service1.Items.Add("--Please Select--")
                For x As Integer = 0 To dtCommon.Rows.Count - 1
                    Service1.Items.Add(dtCommon.Rows(x).Item(0).ToString)
                Next
                If Service1.Text = "--Please Select--" Then
                    If counter = 0 Then
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Please select Service.'); window.location='" + Request.ApplicationPath + "ODCMUser/Schedule.aspx';", True)
                        counter = 1
                        Exit Sub
                    Else
                        GoTo hades
                    End If
                End If

                SqlQuery("select id from servicestbl where serviceoffered='" & Service1.Text & "'")
                Dim ServiceID As String = dtCommon.Rows(0).Item(0).ToString
                SqlQuery("update reservationtbl set datereserved='" & Format(DateReserved1.SelectedDate, "yyyy-MM-dd") & "',timereserved='" & TimeReserved1.SelectedTime.ToString & "',serviceid='" & ServiceID & "',remarks='" & Remarks.Text & "' where ID = '" & ID.Text & "'")
                RadGrid1.MasterTableView.ClearEditItems()
                RadGrid1.Rebind()
                Response.Redirect("~/ODCMUser/Schedule.aspx")


            End If
        End If
hades:
            counter = 0
    End Sub


    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource
        userID = Page.Session("LoginID")
        If Service.Text = Nothing And Status.Text = Nothing Then
            SqlQuery("select a.id as 'ID',b.serviceoffered as 'Service',DATE_FORMAT(a.datereserved,'%M %d, %Y') as 'DateReserved',DATE_FORMAT(a.timereserved,'%h:%i %p') as 'TimeReserved',a.remarks as 'Remarks' from reservationtbl a, servicestbl b where a.serviceid=b.id AND a.clientid = '" & userID & "' AND a.status='Pending' order by a.datereserved")
            RadGrid1.DataSource = dtCommon
            Exit Sub
        End If
        If Service.Text = "All" Then
            SqlQuery("select a.id as 'ID',b.serviceoffered as 'Service',DATE_FORMAT(a.datereserved,'%M %d, %Y') as 'DateReserved',DATE_FORMAT(a.timereserved,'%h:%i %p') as 'TimeReserved',a.remarks as 'Remarks' from reservationtbl a, servicestbl b where a.serviceid=b.id AND a.clientid = '" & userID & "' and a.status='" & Status.Text & "' order by a.datereserved")
            RadGrid1.DataSource = dtCommon
        Else
            SqlQuery("select a.id as 'ID',b.serviceoffered as 'Service',DATE_FORMAT(a.datereserved,'%M %d, %Y') as 'DateReserved',DATE_FORMAT(a.timereserved,'%h:%i %p') as 'TimeReserved',a.remarks as 'Remarks' from reservationtbl a, servicestbl b where a.serviceid=b.id AND a.clientid = '" & userID & "' and a.status='" & Status.Text & "' and b.serviceoffered='" & Service.Text & "' order by a.datereserved")
            RadGrid1.DataSource = dtCommon
        End If

    End Sub

    Public Sub LoadService()
        SqlQuery("select serviceoffered from servicestbl order by serviceoffered")
        Service.Items.Clear()
        Service.Items.Add("All")
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            Service.Items.Add(dtCommon.Rows(x).Item(0).ToString)
        Next
    End Sub

    Private Sub Schedule_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If
        If IsPostBack = False Then
            userID = Page.Session("LoginID")
            LoadService()
        End If
    End Sub

    Private Sub Service_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Service.SelectedIndexChanged
        Dim a As GridNeedDataSourceEventArgs
        RadGrid1_NeedDataSource(sender, a)
        RadGrid1.Rebind()
    End Sub

    Private Sub Status_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Status.SelectedIndexChanged
        Dim a As GridNeedDataSourceEventArgs
        RadGrid1_NeedDataSource(sender, a)
        RadGrid1.Rebind()
    End Sub



    Dim TimeSlot As String() = New String() {8, 11, 14, 17}
    Dim TimeSlot1 As List(Of String) = TimeSlot.ToList()
    Dim TimeSlot2 As String() = {"0"}
    Public Function ReservationLookUp(e As RadDatePicker) As Integer
        SqlQuery("select CAST(DATE_FORMAT(timereserved, '%H') AS UNSIGNED)  from reservationtbl where datereserved='" & Format(e.SelectedDate, "yyyy-MM-dd") & "' AND (status = 'Pending' or status= 'Approved')")
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
            TimeReserved1.TimeView.CustomTimeValues = New String() {TimeSlot2(1), TimeSlot2(2), TimeSlot2(3), TimeSlot2(4)}
        ElseIf count = 3 Then
            TimeReserved1.TimeView.CustomTimeValues = New String() {TimeSlot2(1), TimeSlot2(2), TimeSlot2(3)}
        ElseIf count = 2 Then
            TimeReserved1.TimeView.CustomTimeValues = New String() {TimeSlot2(1), TimeSlot2(2)}
        ElseIf count = 1 Then
            TimeReserved1.TimeView.CustomTimeValues = New String() {TimeSlot2(1)}
        ElseIf count = 0 Then
            TimeReserved1.TimeView.Enabled = False
        End If
        TimeReserved1.TimeView.Columns = 4
        Return 0
    End Function

End Class
