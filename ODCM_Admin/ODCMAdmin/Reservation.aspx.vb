Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports System.Drawing
Imports Microsoft.VisualBasic
Imports System
Imports System.IO
Imports System.Collections
Imports Telerik.Web.UI.Calendar
Imports System.Net
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
Imports GemBox.Spreadsheet
Partial Class Reservation
    Inherits System.Web.UI.Page
    Protected Sub RadGrid_ItemCreated(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid1.ItemCreated
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
                Service1.Text = "--Please Select--"
            End If
        End If
    End Sub

    Protected Sub RadGrid_ItemDeleted(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.DeleteCommand
        Dim item As GridDataItem = CType(e.Item, GridDataItem)
        Dim a As String = item("ID").Text
        SqlQuery("update reservationtbl set status='Disapproved' where id='" & a & "'")
        RadGrid1.MasterTableView.ClearEditItems()
        RadGrid1.Rebind()
        Response.Redirect("Reservation.aspx")
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
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Please select Service.'); window.location='" + Request.ApplicationPath + "Schedule.aspx';", True)
                        counter = 1
                        Exit Sub
                    Else
                        GoTo hades
                    End If
                End If

                SqlQuery("select id from servicestbl where serviceoffered='" & Service1.Text & "'")
                Dim ServiceID As String = dtCommon.Rows(0).Item(0).ToString
                SqlQuery("update reservationtbl set datereserved='" & DateReserved1.SelectedDate & "',timereserved='" & TimeReserved1.SelectedTime.ToString & "',serviceid='" & ServiceID & "',remarks='" & Remarks.Text & "'")
                RadGrid1.MasterTableView.ClearEditItems()
                RadGrid1.Rebind()
                Response.Redirect("Schedule.aspx")


            End If
        End If
hades:
        counter = 0
    End Sub


    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource
        RadGrid1.DataSource = Nothing
        If Service.Text = Nothing And Status.Text = Nothing Then
            SqlQuery("select a.id as 'ID',concat(c.lastname,', ',c.firstname,' ',c.middlename) as 'Clientname',c.phonenumber as 'Mobile',b.serviceoffered as 'Service',DATE_FORMAT(a.datereserved,'%M %d, %Y') as 'DateReserved',DATE_FORMAT(a.timereserved,'%h:%i %p') as 'TimeReserved',a.remarks as 'Remarks' from reservationtbl a, servicestbl b,clienttbl c where a.serviceid=b.id and a.clientid=c.clientid and a.status='Pending' order by a.datereserved")
            RadGrid1.DataSource = dtCommon
        ElseIf Service.Text = "All" Then
            SqlQuery("select a.id as 'ID',concat(c.lastname,', ',c.firstname,' ',c.middlename) as 'Clientname',c.phonenumber as 'Mobile',b.serviceoffered as 'Service',DATE_FORMAT(a.datereserved,'%M %d, %Y') as 'DateReserved',DATE_FORMAT(a.timereserved,'%h:%i %p') as 'TimeReserved',a.remarks as 'Remarks' from reservationtbl a, servicestbl b,clienttbl c where a.serviceid=b.id and a.clientid=c.clientid and a.status='" & Status.Text & "' order by a.datereserved")
            RadGrid1.DataSource = dtCommon
        Else
            SqlQuery("select a.id as 'ID',concat(c.lastname,', ',c.firstname,' ',c.middlename) as 'Clientname',c.phonenumber as 'Mobile',b.serviceoffered as 'Service',DATE_FORMAT(a.datereserved,'%M %d, %Y') as 'DateReserved',DATE_FORMAT(a.timereserved,'%h:%i %p') as 'TimeReserved',a.remarks as 'Remarks' from reservationtbl a, servicestbl b,clienttbl c where a.serviceid=b.id and a.clientid=c.clientid and a.status='" & Status.Text & "' and b.serviceoffered='" & Service.Text & "' order by a.datereserved")
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
        If Status.Text <> "Pending" Then
            'RadGrid1.Columns(5).Visible = False
            'RadGrid1.Columns(6).Visible = False

            RadGrid1.Columns(7).Visible = False
            RadGrid1.Columns(8).Visible = False
        Else
            RadGrid1.Columns(5).Visible = True
            RadGrid1.Columns(6).Visible = True

            RadGrid1.Columns(7).Visible = True
            RadGrid1.Columns(8).Visible = True
        End If
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
    Private Sub RadGrid1_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGrid1.ItemCommand
        If e.CommandName = "Delete" Then
            Dim item As GridDataItem = CType(e.Item, GridDataItem)
            Dim a As String = item("ID").Text
            SqlQuery("update reservationtbl set status='Disapproved' where id='" & a & "'")

        ElseIf e.CommandName = "Confirm"
            Dim item As GridDataItem = CType(e.Item, GridDataItem)
            Dim a As String = item("ID").Text
            Dim mobile As String = item("Mobile").Text
            SqlQuery("update reservationtbl set status='Approved' where id='" & a & "'")

            For Each line As String In System.IO.File.ReadAllLines(Server.MapPath("~/bin/SMSVianett.csv"))
                SMSVianettAccnt = line.Split(",")
            Next

            send(SMSVianettAccnt(0), SMSVianettAccnt(1), "Your reservation in Dentcast has been approved!" & vbNewLine & "Please visit the website and check your reservation.", mobile)

        End If
        RadGrid1.MasterTableView.ClearEditItems()
        RadGrid1.Rebind()
        Response.Redirect("Reservation.aspx")
        Dim ab As GridNeedDataSourceEventArgs
        RadGrid1_NeedDataSource(sender, ab)
        RadGrid1.Rebind()
    End Sub
    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click
        If Service.Text = Nothing And Status.Text = Nothing Then
            SqlQuery("select a.id as 'ID',concat(c.lastname,', ',c.firstname,' ',c.middlename) as 'Clientname',c.phonenumber as 'Mobile',b.serviceoffered as 'Service',DATE_FORMAT(a.datereserved,'%M %d, %Y') as 'DateReserved',DATE_FORMAT(a.timereserved,'%h:%i %p') as 'TimeReserved',a.remarks as 'Remarks' from reservationtbl a, servicestbl b,clienttbl c where a.serviceid=b.id and a.clientid=c.clientid and a.status='Pending' order by a.datereserved")
        ElseIf Service.Text = "All" Then
            SqlQuery("select a.id as 'ID',concat(c.lastname,', ',c.firstname,' ',c.middlename) as 'Clientname',c.phonenumber as 'Mobile',b.serviceoffered as 'Service',DATE_FORMAT(a.datereserved,'%M %d, %Y') as 'DateReserved',DATE_FORMAT(a.timereserved,'%h:%i %p') as 'TimeReserved',a.remarks as 'Remarks' from reservationtbl a, servicestbl b,clienttbl c where a.serviceid=b.id and a.clientid=c.clientid and a.status='" & Status.Text & "' order by a.datereserved")
        Else
            SqlQuery("select a.id as 'ID',concat(c.lastname,', ',c.firstname,' ',c.middlename) as 'Clientname',c.phonenumber as 'Mobile',b.serviceoffered as 'Service',DATE_FORMAT(a.datereserved,'%M %d, %Y') as 'DateReserved',DATE_FORMAT(a.timereserved,'%h:%i %p') as 'TimeReserved',a.remarks as 'Remarks' from reservationtbl a, servicestbl b,clienttbl c where a.serviceid=b.id and a.clientid=c.clientid and a.status='" & Status.Text & "' and b.serviceoffered='" & Service.Text & "' order by a.datereserved")
        End If

        Dim rptTbl As New DataTable

        With rptTbl.Columns
            .Add("ClientName")
            .Add("Service")
            .Add("DateReserved")
            .Add("TimeReserved")
            .Add("Remarks")
        End With

        For x As Integer = 0 To dtCommon.Rows.Count - 1
            rptTbl.Rows.Add(dtCommon.Rows(x).Item(1), dtCommon.Rows(x).Item(3), dtCommon.Rows(x).Item(4), dtCommon.Rows(x).Item(5), dtCommon.Rows(x).Item(6))
        Next

        SpreadsheetInfo.SetLicense("E5M9-UYGW-HF3O-VETZ")
        Dim path As String = Server.MapPath("~\ToPrint\")
        Dim NameOfFile As String = path & "ReservationList.xlsx"

        Dim WB As ExcelFile = ExcelFile.Load(NameOfFile)
        Dim WS As ExcelWorksheet = WB.Worksheets.ActiveWorksheet


        WB.Worksheets.Item(0).Cells("B10").Value = Service.Text
        WB.Worksheets.Item(0).Cells("D10").Value = Status.Text
        WS.Cells.Style.WrapText = True
        WS.InsertDataTable(rptTbl, New InsertDataTableOptions("A12"))

        Dim Filename As String = "ReservationList_" & Format(DateTime.Now, "MMddyyyy_HHmmss") & ".pdf"
        Dim strFileName As String = path & Filename
        Dim blnFileOpen As Boolean = False


        Try
            Dim fileTemp As System.IO.FileStream = System.IO.File.OpenWrite(strFileName)
            fileTemp.Close()
        Catch ex As Exception
            blnFileOpen = False
            End Try

            If System.IO.File.Exists(strFileName) Then
                System.IO.File.Delete(strFileName)
            End If



        WB.Save(strFileName)


        Dim FP As String = Server.MapPath("~/ToPrint/" & Filename)

        Dim user As New WebClient
        Dim FB As Byte() = user.DownloadData(FP)
        If Not FB Is Nothing Then
            Response.ClearContent()
            Response.Clear()
            Response.ContentType = "application/pdf"
            Response.AddHeader("content-length", FB.Length.ToString())
            Response.BinaryWrite(FB)
        End If

        'Dim response As HttpResponse = HttpContext.Current.Response
        'response.ClearContent()
        'response.Clear()
        'response.ContentType = "application/word"
        'response.AddHeader("Content-Disposition", "attachment; filename=ClientList_" & Format(DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Local), "MMddyyyy_HHmmss") & ".pdf")
        'response.TransmitFile(Server.MapPath("~/ToPrint/" & Filename))
        'response.Flush()

        File.Delete(Server.MapPath("~/ToPrint/" & Filename))


        Response.End()


    End Sub
End Class
