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
Partial Class Service
    Inherits System.Web.UI.Page
    Protected Sub RadGrid1_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        Dim rowLength As Integer = 0

        For rowLength = 1 To RadGrid1.MasterTableView.Items.Count
            Dim row As Integer = rowLength - 1
            RadGrid1.Items(rowLength - 1).Cells(2).Text = row.ToString()

        Next
    End Sub
    Protected Sub RadGrid_ItemCreated(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid1.ItemCreated
        Dim id As String
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If Not (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                Dim editor As GridTextBoxColumnEditor = TryCast(manager.GetColumnEditor("ID"), GridTextBoxColumnEditor)
                editor.TextBoxControl.Enabled = False
                id = editor.Text
            End If
            If (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                Dim editor As GridTextBoxColumnEditor = TryCast(manager.GetColumnEditor("ID"), GridTextBoxColumnEditor)
                editor.TextBoxControl.Enabled = False
            End If
        End If
    End Sub
    Protected Sub RadGrid_InsertCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.InsertCommand
        Dim ID, Services As GridTextBoxColumnEditor
        Dim serviceid, product As String
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                ID = TryCast(manager.GetColumnEditor("ID"), GridTextBoxColumnEditor)
                serviceid = ID.Text
                Services = TryCast(manager.GetColumnEditor("Services"), GridTextBoxColumnEditor)
                Services.TextBoxControl.Enabled = True
                product = Services.Text
                SqlQuery("insert into servicestbl(serviceoffered) values('" & product & "')")
                RadGrid1.MasterTableView.ClearEditItems()
                RadGrid1.MasterTableView.IsItemInserted = False
                RadGrid1.MasterTableView.Rebind()
                Response.Redirect("Service.aspx")
            End If
        End If
    End Sub

    Protected Sub RadGrid_ItemDeleted(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.DeleteCommand
        Dim item As GridDataItem = CType(e.Item, GridDataItem)
        Dim a As String = item("ID").Text
        SqlQuery("delete from servicestbl where id='" & a & "'")
        RadGrid1.MasterTableView.ClearEditItems()
        RadGrid1.Rebind()
        Response.Redirect("Service.aspx")
    End Sub

    Protected Sub RadGrid_ItemUpdated(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.EditCommand
        Dim ID, Services As GridTextBoxColumnEditor
        Dim serviceid, product As String
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If Not (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                ID = TryCast(manager.GetColumnEditor("ID"), GridTextBoxColumnEditor)
                serviceid = ID.Text
                Services = TryCast(manager.GetColumnEditor("Services"), GridTextBoxColumnEditor)
                Services.TextBoxControl.Enabled = True
                product = Services.Text
                SqlQuery("update servicestbl set serviceoffered='" & product & "' where id='" & serviceid & "'")
                RadGrid1.MasterTableView.ClearEditItems()
                RadGrid1.Rebind()
                Response.Redirect("Service.aspx")
            End If
        End If
    End Sub


    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource
        If RadTextBox1.Text = Nothing Then
            SqlQuery("Select id, serviceoffered as 'Services Offered' from servicestbl order by serviceoffered")
            RadGrid1.DataSource = dtCommon
        Else
            SqlQuery("Select id, serviceoffered as 'Services Offered' from servicestbl where serviceoffered like '" & RadTextBox1.Text & "%' order by serviceoffered")
            RadGrid1.DataSource = dtCommon
        End If
    End Sub

    Private Sub RadTextBox1_TextChanged(sender As Object, e As EventArgs) Handles RadTextBox1.TextChanged
        Dim a As GridNeedDataSourceEventArgs
        RadGrid1_NeedDataSource(sender, a)
        RadGrid1.Rebind()
    End Sub
    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click
        If RadTextBox1.Text = Nothing Then
            SqlQuery("Select serviceoffered as 'Services Offered' from servicestbl order by serviceoffered")
        Else
            SqlQuery("Select serviceoffered as 'Services Offered' from servicestbl where serviceoffered like '" & RadTextBox1.Text & "%' order by serviceoffered")
        End If

        Dim rptTbl As New DataTable

        With rptTbl.Columns
            .Add("ClientName")
            .Add("Service")
        End With

        For x As Integer = 0 To dtCommon.Rows.Count - 1
            rptTbl.Rows.Add(x + 1, dtCommon.Rows(x).Item(0))
        Next

        SpreadsheetInfo.SetLicense("E5M9-UYGW-HF3O-VETZ")
        Dim path As String = Server.MapPath("~\ToPrint\")
        Dim NameOfFile As String = path & "ServicesOffered.xlsx"

        Dim WB As ExcelFile = ExcelFile.Load(NameOfFile)
        Dim WS As ExcelWorksheet = WB.Worksheets.ActiveWorksheet
        WS.Cells.Style.ShrinkToFit = True

        WS.InsertDataTable(rptTbl, New InsertDataTableOptions("A11"))

        Dim Filename As String = "ServicesOffered_" & Format(DateTime.Now, "MMddyyyy_HHmmss") & ".pdf"
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
