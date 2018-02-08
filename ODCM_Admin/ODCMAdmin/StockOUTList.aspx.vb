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

Partial Class StockOUTList
    Inherits System.Web.UI.Page

    Dim SuppliesTBL As New DataTable
    Dim stringHolder As String
    Private Sub StockOUTList_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If
        If IsPostBack = False Then
            LoadSupply()
        End If
    End Sub

    Public Sub LoadSupply()
        LoadService()
        SqlQuery("select Itemname,Quantity from stockoutlist where operation='" & Service.Text & "'")
        RadGrid1.DataSource = dtCommon

        Console.WriteLine(stringHolder)

    End Sub
    Protected Sub RadGrid_ItemCreated(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid1.ItemCreated
        Dim ID, Quantity As GridTextBoxColumnEditor
        Dim ItemName As GridTemplateColumnEditor
        Dim ItemName1 As RadComboBox
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                ItemName = CType(manager.GetColumnEditor("ItemName"), GridTemplateColumnEditor)
                Quantity = TryCast(manager.GetColumnEditor("Quantity"), GridTextBoxColumnEditor)
                ID = TryCast(manager.GetColumnEditor("ID"), GridTextBoxColumnEditor)
                ID.TextBoxControl.Enabled = False
                ItemName1 = item.FindControl("List1")
                SqlQuery("select Itemname from suppliestbl order by itemname")
                ItemName1.Items.Clear()
                For x As Integer = 0 To dtCommon.Rows.Count - 1
                    ItemName1.Items.Add(dtCommon.Rows(x).Item(0).ToString)
                Next
                ItemName1.Text = "--Please Select--"
            End If
        End If
    End Sub


    Public Sub LoadService()
        SqlQuery("select serviceoffered from servicestbl order by serviceoffered")
        Service.Items.Clear()
        Service.Items.Add("-- Please Select --")
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            Service.Items.Add(dtCommon.Rows(x).Item(0).ToString)
        Next
    End Sub

    Dim counter = 0
    Protected Sub RadGrid_InsertCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.InsertCommand
        Dim ID, Quantity As GridTextBoxColumnEditor
        Dim ItemName As GridTemplateColumnEditor
        Dim ItemName1 As RadComboBox
        Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
        Dim manager As GridEditManager = item.EditManager
        ID = TryCast(manager.GetColumnEditor("ID"), GridTextBoxColumnEditor)
        ItemName = CType(manager.GetColumnEditor("ItemName"), GridTemplateColumnEditor)
        Quantity = TryCast(manager.GetColumnEditor("Quantity"), GridTextBoxColumnEditor)
        ID.TextBoxControl.Enabled = False
        ItemName1 = item.FindControl("List1")
        SqlQuery("select itemname from suppliestbl order by itemname")
        ItemName1.Items.Clear()
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            ItemName1.Items.Add(dtCommon.Rows(x).Item(0).ToString)
        Next
        If IsNumeric(Quantity.Text) = False And Quantity.Text <> Nothing Then
            If counter = 0 Then
                RadWindowManager2.RadAlert("Input number only.", 330, 180, "DENTCAST", "callBackFn", "Images/Error.png")
                counter = 1
                Exit Sub
            Else
                GoTo hades
            End If
        End If
        Dim serviceStr As String = Session("service").ToString
        If serviceStr = "-- Please Select --" Then
            RadWindowManager2.RadAlert("Please select  service.", 330, 180, "DENTCAST", "callBackFn", "Images/Error.png")
        Else
            SqlQuery("insert into stockoutlist(itemname,quantity,operation) values('" & ItemName1.Text & "','" & Quantity.Text & "','" & serviceStr & "')")
            RadGrid1.MasterTableView.ClearEditItems()
            RadGrid1.MasterTableView.IsItemInserted = False
            RadGrid1.MasterTableView.Rebind()
            Page.Session("Operation") = Service.Text
            Page.Session("service") = "-- Please Select --"
            Response.Redirect("StockOUTList.aspx")
        End If



hades:
        counter = 0
    End Sub



    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource
        LoadSupply()
    End Sub


    Protected Sub RadGrid_ItemDeleted(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.DeleteCommand
        Dim item As GridDataItem = CType(e.Item, GridDataItem)
        Dim a As String = item("ID").Text
        SqlQuery("Delete from stockoutlist where ID='" & a & "' and operation='" & Service.Text & "'")
        RadGrid1.MasterTableView.ClearEditItems()
        RadGrid1.Rebind()
        Response.Redirect("StockOUTList.aspx")
    End Sub
    Protected Sub Service_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Service.SelectedIndexChanged
        Session("service") = Service.Text
        SqlQuery("select ID,Itemname,Quantity from stockoutlist where operation='" & Service.Text & "'")
        RadGrid1.DataSource = dtCommon
        RadGrid1.DataBind()
    End Sub
    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click
        SqlQuery("select ID,Itemname,Quantity from stockoutlist where operation='" & Service.Text & "'")


        Dim rptTbl As New DataTable

        With rptTbl.Columns
            .Add("ItemName")
            .Add("Quantity")
        End With

        For x As Integer = 0 To dtCommon.Rows.Count - 1
            rptTbl.Rows.Add(dtCommon.Rows(x).Item(1), dtCommon.Rows(x).Item(2))
        Next

        SpreadsheetInfo.SetLicense("E5M9-UYGW-HF3O-VETZ")
        Dim path As String = Server.MapPath("~\ToPrint\")
        Dim NameOfFile As String = path & "StockoutList.xlsx"

        Dim WB As ExcelFile = ExcelFile.Load(NameOfFile)
        Dim WS As ExcelWorksheet = WB.Worksheets.ActiveWorksheet
        WS.Cells.Style.ShrinkToFit = True

        WB.Worksheets.Item(0).Cells("A8").Value = "STOCK OUT LIST FOR " & Service.Text.ToUpper

        WS.InsertDataTable(rptTbl, New InsertDataTableOptions("A11"))

        Dim Filename As String = "StockOutList" & Format(DateTime.Now, "MMddyyyy_HHmmss") & ".pdf"
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
