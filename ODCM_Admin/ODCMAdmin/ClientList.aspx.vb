Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports System.Data
Imports System.IO
Imports GemBox.Spreadsheet
Imports System.Web.UI
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Net
Imports System.Linq
Imports System.Collections.Generic
Imports System
Partial Class ClientList
    Inherits System.Web.UI.Page
    Public Sub LoadClients()
        SqlQuery("SELECT ClientTbl.LastName,ClientTbl.FirstName,ClientTbl.MiddleName,(Select IFNULL(max(DATE_FORMAT(patientteeth.examdate, '%M %d, %Y')), 'No records to display.')) as examdate FROM clienttbl LEFT OUTER JOIN  patientteeth ON ClientTbl.clientID = patientteeth.clientID WHERE clienttbl.isverified = 1 AND role = 'User' GROUP BY clienttbl.clientID ORDER BY clienttbl.lastname")
        RadGrid1.DataSource = dtCommon
        RadGrid1.DataBind()
    End Sub

    Private Sub ClientList_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If
        If IsPostBack = False Then
            LoadClients()
        End If
    End Sub
    Public Sub SearchStudent()
        SqlQuery("SELECT ClientTbl.LastName,ClientTbl.FirstName,ClientTbl.MiddleName,(Select max(DATE_FORMAT(patientteeth.examdate, '%M %d, %Y'))) as examdate FROM clienttbl LEFT OUTER JOIN patientteeth ON ClientTbl.clientID = patientteeth.clientID WHERE (ClientTbl.LastName LIKE '" & RadTextBox1.Text & "%' OR ClientTbl.FirstName LIKE '" & RadTextBox1.Text & "%' OR ClientTbl.MiddleName LIKE '" & RadTextBox1.Text & "%') AND clienttbl.IsVerified = 1 AND role = 'User' ORDER BY patientteeth.examdate DESC , ClientTbl.LastName")
        RadGrid1.DataSource = dtCommon
        RadGrid1.DataBind()
    End Sub



    Private Sub RadGrid1_PageIndexChanged(sender As Object, e As GridPageChangedEventArgs) Handles RadGrid1.PageIndexChanged
        RadGrid1.CurrentPageIndex = e.NewPageIndex
        If RadTextBox1.Text = Nothing Then
            LoadClients()
        Else
            SearchStudent()
        End If
    End Sub

    Private Sub RadGrid1_PageSizeChanged(sender As Object, e As GridPageSizeChangedEventArgs) Handles RadGrid1.PageSizeChanged
        RadGrid1.CurrentPageIndex = e.NewPageSize
        If RadTextBox1.Text = Nothing Then
            LoadClients()
        Else
            SearchStudent()
        End If
    End Sub

    Private Sub RadTextBox1_TextChanged(sender As Object, e As EventArgs) Handles RadTextBox1.TextChanged
        If RadTextBox1.Text = Nothing Then
            LoadClients()
        Else
            SearchStudent()
        End If
    End Sub
    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click

        If RadTextBox1.Text = Nothing Then
            LoadClients()
        Else
            SearchStudent()
        End If


        SpreadsheetInfo.SetLicense("E5M9-UYGW-HF3O-VETZ")
        Dim path As String = Server.MapPath("~\ToPrint\")
        Dim NameOfFile As String = path & "ClientList.xlsx"

        Dim WB As ExcelFile = ExcelFile.Load(NameOfFile)
        Dim WS As ExcelWorksheet = WB.Worksheets.ActiveWorksheet

        WS.Cells.Style.WrapText = True
        WS.InsertDataTable(dtCommon, New InsertDataTableOptions("A11"))

        Dim Filename As String = "ClientList_" & Format(DateTime.Now, "MMddyyyy_HHmmss") & ".pdf"
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
