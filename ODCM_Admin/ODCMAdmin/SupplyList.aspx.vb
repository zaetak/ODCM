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

Partial Class SupplyList
    Inherits System.Web.UI.Page


    Private Sub SupplyList_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If


        SqlQuery("select itemname,DATE_FORMAT(ExpiDate,'%M %d, %Y') from suppliestbl where ExpiDate <= NOW() order by itemname")
        Dim noti, noti1 As String
        noti1 = Nothing
        noti = "Expired Items:"
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            noti1 = noti1 & vbTab & dtCommon.Rows(x).Item(0)
            If x = dtCommon.Rows.Count - 1 Then
                noti1 = noti1
            Else
                noti1 = noti1 & ","
            End If
        Next
        If noti1 <> Nothing Then
            RadNotification1.Text = noti & vbNewLine & noti1
            RadNotification1.ContentIcon = "warning"
            RadNotification1.Show()
        End If

    End Sub

    Public Sub LoadSupply()
        SqlQuery("select SupplyID,Invoice as 'InvoiceNo',Supplier,Itemname as 'Item Name',Quantity as 'Quantity',UOM as 'UOM',Category as 'Category',DATE_FORMAT(ExpiDate,'%M %d, %Y') as 'ExpiDate' from suppliestbl order by UOM")
        RadGrid1.DataSource = dtCommon
    End Sub
    Private Sub Category_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Category.SelectedIndexChanged
        Dim a As GridNeedDataSourceEventArgs
        RadGrid1_NeedDataSource(sender, a)
        RadGrid1.Rebind()
    End Sub

    Private Sub RadTextBox1_TextChanged(sender As Object, e As EventArgs) Handles RadTextBox1.TextChanged
        Dim a As GridNeedDataSourceEventArgs
        RadGrid1_NeedDataSource(sender, a)
        RadGrid1.Rebind()
    End Sub

    Protected CategoryList As Object() = {New ListItem("Consumables", "Consumables"), New ListItem("Disposables", "Disposables")}
    Protected Sub RadGrid_ItemCreated(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid1.ItemCreated
        Dim ID, ItemName, Quantity, Supplier, Invoice As GridTextBoxColumnEditor
        Dim UOM, Category, ExpiDate As GridTemplateColumnEditor
        Dim UOM1, Category1 As RadComboBox
        Dim ExpiDate1 As RadDatePicker
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If Not (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                ID = TryCast(manager.GetColumnEditor("SupplyID"), GridTextBoxColumnEditor)
                Invoice = TryCast(manager.GetColumnEditor("InvoiceNo"), GridTextBoxColumnEditor)
                Supplier = TryCast(manager.GetColumnEditor("Supplier"), GridTextBoxColumnEditor)
                ItemName = TryCast(manager.GetColumnEditor("Itemname"), GridTextBoxColumnEditor)
                Quantity = TryCast(manager.GetColumnEditor("Quantity"), GridTextBoxColumnEditor)
                ExpiDate = CType(manager.GetColumnEditor("ExpiDate"), GridTemplateColumnEditor)
                UOM = CType(manager.GetColumnEditor("UOM"), GridTemplateColumnEditor)
                Category = CType(manager.GetColumnEditor("Category"), GridTemplateColumnEditor)
                ID.TextBoxControl.Enabled = False
                Quantity.TextBoxControl.Enabled = False
                ExpiDate1 = item.FindControl("ExpiDate")

                UOM1 = item.FindControl("List1")
                SqlQuery("select uom_name from odcmdb.uom;")
                UOM1.Items.Clear()
                For x As Integer = 0 To dtCommon.Rows.Count - 1
                    UOM1.Items.Add(dtCommon.Rows(x).Item(0).ToString)
                Next

                UOM1.Text = "--Please Select--"

                Category1 = item.FindControl("List2")
                SqlQuery("select cat_name from odcmdb.category;")
                Category1.Items.Clear()
                For x As Integer = 0 To dtCommon.Rows.Count - 1
                    Category1.Items.Add(dtCommon.Rows(x).Item(0).ToString)
                Next
                'Category1.DataSource = CategoryList
                'Category1.DataBind()
            End If
            If (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                ID = TryCast(manager.GetColumnEditor("SupplyID"), GridTextBoxColumnEditor)
                Invoice = TryCast(manager.GetColumnEditor("InvoiceNo"), GridTextBoxColumnEditor)
                Supplier = TryCast(manager.GetColumnEditor("Supplier"), GridTextBoxColumnEditor)
                ItemName = TryCast(manager.GetColumnEditor("Itemname"), GridTextBoxColumnEditor)
                Quantity = TryCast(manager.GetColumnEditor("Quantity"), GridTextBoxColumnEditor)
                ExpiDate = CType(manager.GetColumnEditor("ExpiDate"), GridTemplateColumnEditor)
                UOM = CType(manager.GetColumnEditor("UOM"), GridTemplateColumnEditor)
                UOM = CType(manager.GetColumnEditor("UOM"), GridTemplateColumnEditor)
                Category = CType(manager.GetColumnEditor("Category"), GridTemplateColumnEditor)
                ID.TextBoxControl.Enabled = False
                UOM1 = item.FindControl("List1")
                SqlQuery("SELECT uom_name FROM odcmdb.uom;")
                ExpiDate1 = item.FindControl("ExpiDate")
                UOM1.Items.Clear()
                For x As Integer = 0 To dtCommon.Rows.Count - 1
                    UOM1.Items.Add(dtCommon.Rows(x).Item(0).ToString)
                Next
                UOM1.Text = "--Please Select--"
                Category1 = item.FindControl("List2")
                SqlQuery("select cat_name from odcmdb.category;")
                Category1.Items.Clear()
                For x As Integer = 0 To dtCommon.Rows.Count - 1
                    Category1.Items.Add(dtCommon.Rows(x).Item(0).ToString)
                Next
            End If
        End If
    End Sub
    Dim counter = 0
    Protected Sub RadGrid_InsertCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.InsertCommand
        Dim ID, ItemName, Quantity, Supplier, Invoice As GridTextBoxColumnEditor
        Dim UOM, Category, ExpiDate As GridTemplateColumnEditor
        Dim UOM1, Category1 As RadComboBox
        Dim ExpiDate1 As RadDatePicker
        Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
        Dim manager As GridEditManager = item.EditManager
        ID = TryCast(manager.GetColumnEditor("SupplyID"), GridTextBoxColumnEditor)
        Invoice = TryCast(manager.GetColumnEditor("InvoiceNo"), GridTextBoxColumnEditor)
        ItemName = TryCast(manager.GetColumnEditor("Itemname"), GridTextBoxColumnEditor)
        Supplier = TryCast(manager.GetColumnEditor("Supplier"), GridTextBoxColumnEditor)
        Quantity = TryCast(manager.GetColumnEditor("Quantity"), GridTextBoxColumnEditor)
        ExpiDate = CType(manager.GetColumnEditor("ExpiDate"), GridTemplateColumnEditor)
        UOM = CType(manager.GetColumnEditor("UOM"), GridTemplateColumnEditor)
        Category = CType(manager.GetColumnEditor("Category"), GridTemplateColumnEditor)

        ID.TextBoxControl.Enabled = False
        UOM1 = item.FindControl("List1")
        UOM1.AllowCustomText = True
        SqlQuery("select uom_name from odcmdb.uom;")
        ExpiDate1 = item.FindControl("RadDatePicker1")
        UOM1.Items.Clear()
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            UOM1.Items.Add(dtCommon.Rows(x).Item(0).ToString)
        Next
        SqlQuery("select count(*) from suppliestbl where itemname='" & ItemName.TextBoxControl.Text & "'")
        If dtCommon.Rows(0).Item(0) > 0 Then
            If counter = 0 Then
                RadWindowManager2.RadAlert("Itemname already exists.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
                counter = 1
                Exit Sub
            Else
                GoTo hades
            End If
        ElseIf UOM1.Text = "--Please Select--" Then
            If counter = 0 Then
                RadWindowManager2.RadAlert("Please select UOM.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
                counter = 1
                Exit Sub
            Else
                GoTo hades
            End If
        ElseIf IsNumeric(Quantity.Text) = False Then
            If counter = 0 Then
                RadWindowManager2.RadAlert("Input number only.", 330, 180, "DENTCAST", "callBackFn", "/Images/Error.png")
                counter = 1
                Exit Sub
            Else
                GoTo hades
            End If
        End If

        Category1 = item.FindControl("List2")
        SqlQuery("select cat_name from odcmdb.category;")
        Category1.Items.Clear()
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            Category1.Items.Add(dtCommon.Rows(x).Item(0).ToString)
        Next

        SqlQuery("select uom_name from uom where uom_name='" & UOM1.Text & "'")
        If dtCommon.Rows.Count = 0 Then
            SqlQuery("insert into uom(uom_name) values('" & UOM1.Text & "')")
        End If


        SqlQuery("insert into suppliestbl(invoice, ItemName, Quantity, Category, UOM, Supplier, ExpiDate) values('" & Invoice.TextBoxControl.Text & "','" & ItemName.TextBoxControl.Text & "','" & Quantity.TextBoxControl.Text & "','" & Category1.Text & "','" & UOM1.Text & "','" & Supplier.TextBoxControl.Text & "','" & Format(ExpiDate1.SelectedDate, "yyyy-MM-dd") & "')")
        RadGrid1.MasterTableView.ClearEditItems()
        RadGrid1.MasterTableView.IsItemInserted = False
        RadGrid1.MasterTableView.Rebind()
        Response.Redirect("SupplyList.aspx")
hades:
        counter = 0
    End Sub



    Protected Sub RadGrid_ItemUpdated(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.EditCommand
        Dim ID, ItemName, Quantity, Supplier, Invoice As GridTextBoxColumnEditor
        Dim UOM, Category, ExpiDate As GridTemplateColumnEditor
        Dim UOM1, Category1 As RadComboBox
        Dim ExpiDate1 As RadDatePicker
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If Not (TypeOf e.Item Is GridEditFormInsertItem) Then

                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                ID = TryCast(manager.GetColumnEditor("SupplyID"), GridTextBoxColumnEditor)
                Invoice = TryCast(manager.GetColumnEditor("InvoiceNo"), GridTextBoxColumnEditor)
                Supplier = TryCast(manager.GetColumnEditor("Supplier"), GridTextBoxColumnEditor)
                ItemName = TryCast(manager.GetColumnEditor("Itemname"), GridTextBoxColumnEditor)
                Quantity = TryCast(manager.GetColumnEditor("Quantity"), GridTextBoxColumnEditor)
                ExpiDate = CType(manager.GetColumnEditor("ExpiDate"), GridTemplateColumnEditor)
                UOM = CType(manager.GetColumnEditor("UOM"), GridTemplateColumnEditor)
                Category = CType(manager.GetColumnEditor("Category"), GridTemplateColumnEditor)

                ID.TextBoxControl.Enabled = False
                Quantity.TextBoxControl.Enabled = False

                UOM1 = item.FindControl("List1")
                UOM1.AllowCustomText = True
                SqlQuery("select uom_name from odcmdb.uom;")
                ExpiDate1 = CType(item.FindControl("RadDatePicker1"), RadDatePicker)
                UOM1.Items.Clear()
                For x As Integer = 0 To dtCommon.Rows.Count - 1
                    UOM1.Items.Add(dtCommon.Rows(x).Item(0).ToString)
                Next
                If UOM1.Text = "--Please Select--" Then
                    If counter = 0 Then
                        RadWindowManager2.RadAlert("Please select UOM.", 330, 180, "DENTCAST", "callBackFn", "Images/Error.png")
                        counter = 1
                        Exit Sub
                    Else
                        GoTo hades
                    End If
                End If

                Category1 = item.FindControl("List2")
                Category1.DataSource = CategoryList
                Category1.DataBind()

                SqlQuery("update suppliestbl set invoice='" & Invoice.TextBoxControl.Text & "',expidate='" & Format(ExpiDate1.SelectedDate, "yyyy-MM-dd") & "',supplier='" & Supplier.TextBoxControl.Text & "',itemname='" & ItemName.TextBoxControl.Text & "',UOM='" & UOM1.Text & "',category='" & Category1.Text & "' where supplyid='" & ID.TextBoxControl.Text & "'")

                RadGrid1.MasterTableView.ClearEditItems()
                RadGrid1.Rebind()
                Response.Redirect("SupplyList.aspx")
            End If
        End If
hades:
        counter = 0
    End Sub


    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource
        If RadTextBox1.Text = Nothing And (Category.Text = "ALL" Or Category.Text = Nothing) Then
            LoadSupply()
        ElseIf Category.Text = "ALL" And RadTextBox1.Text <> Nothing Then
            SqlQuery("select SupplyID,Invoice as 'InvoiceNo',Supplier,Itemname as 'Item Name',Quantity,DATE_FORMAT(ExpiDate,'%M %d, %Y') as 'ExpiDate',UOM,Category from suppliestbl where itemname like '" & RadTextBox1.Text & "%' order by supplyid")
            RadGrid1.DataSource = dtCommon
        ElseIf Category.Text <> "ALL" And RadTextBox1.Text = Nothing Then
            SqlQuery("select SupplyID,Invoice as 'InvoiceNo',Supplier,Itemname as 'Item Name',Quantity,DATE_FORMAT(ExpiDate,'%M %d, %Y') as 'ExpiDate',UOM,Category from suppliestbl where category='" & Category.Text & "' order by supplyid")
            RadGrid1.DataSource = dtCommon

        ElseIf Category.Text <> "ALL" And RadTextBox1.Text <> Nothing
            SqlQuery("select SupplyID,Invoice as 'InvoiceNo',Supplier,Itemname as 'Item Name',Quantity,DATE_FORMAT(ExpiDate,'%M %d, %Y') as 'ExpiDate',UOM,Category from suppliestbl where category='" & Category.Text & "' and itemname like '" & RadTextBox1.Text & "%' order by supplyid")
            RadGrid1.DataSource = dtCommon

        End If
    End Sub


    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click
        If RadTextBox1.Text = Nothing And (Category.Text = "ALL" Or Category.Text = Nothing) Then
            LoadSupply()
        ElseIf Category.Text = "ALL" And RadTextBox1.Text <> Nothing Then
            SqlQuery("select SupplyID,Invoice as 'InvoiceNo',Supplier,Itemname as 'Item Name',Quantity,DATE_FORMAT(ExpiDate,'%M %d, %Y') as 'ExpiDate',UOM,Category from suppliestbl where itemname like '" & RadTextBox1.Text & "%' order by supplyid")
        ElseIf Category.Text <> "ALL" And RadTextBox1.Text = Nothing Then
            SqlQuery("select SupplyID,Invoice as 'InvoiceNo',Supplier,Itemname as 'Item Name',Quantity,DATE_FORMAT(ExpiDate,'%M %d, %Y') as 'ExpiDate',UOM,Category from suppliestbl where category='" & Category.Text & "' order by supplyid")
        ElseIf Category.Text <> "ALL" And RadTextBox1.Text <> Nothing
            SqlQuery("select SupplyID,Invoice as 'InvoiceNo',Supplier,Itemname as 'Item Name',Quantity,DATE_FORMAT(ExpiDate,'%M %d, %Y') as 'ExpiDate',UOM,Category from suppliestbl where category='" & Category.Text & "' and itemname like '" & RadTextBox1.Text & "%' order by supplyid")
        End If

        Dim rptTbl As New DataTable

        With rptTbl.Columns
            .Add("InvoiceNo")
            .Add("Supplier")
            .Add("ItemName")
            .Add("Quantity")
            .Add("ExpirationDate")
            .Add("UOM")
            .Add("Category")
        End With

        For x As Integer = 0 To dtCommon.Rows.Count - 1
            rptTbl.Rows.Add(dtCommon.Rows(x).Item(1), dtCommon.Rows(x).Item(2), dtCommon.Rows(x).Item(3), dtCommon.Rows(x).Item(4), dtCommon.Rows(x).Item(5), dtCommon.Rows(x).Item(6), dtCommon.Rows(x).Item(7))
        Next

        SpreadsheetInfo.SetLicense("E5M9-UYGW-HF3O-VETZ")
        Dim path As String = Server.MapPath("~\ToPrint\")
        Dim NameOfFile As String = path & "SupplyList.xlsx"

        Dim WB As ExcelFile = ExcelFile.Load(NameOfFile)
        Dim WS As ExcelWorksheet = WB.Worksheets.ActiveWorksheet
        WS.Cells.Style.ShrinkToFit = True

        WS.InsertDataTable(rptTbl, New InsertDataTableOptions("A11"))

        Dim Filename As String = "SupplyList_" & Format(DateTime.Now, "MMddyyyy_HHmmss") & ".pdf"
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
