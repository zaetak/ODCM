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
Partial Class StockLogs
    Inherits System.Web.UI.Page

    Private Sub StockLogs_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If
        If IsPostBack = False Then
            Stock.SelectedValue = "IN"
            LoadSupply1()
            LoadCategory()
        End If
    End Sub

    Public Sub LoadSupply1()
        SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and b.stock='IN' ORDER BY b.datestock DESC")
        RadGrid1.DataSource = dtCommon
        RadGrid1.DataBind()
    End Sub

    Public Sub LoadCategory()
        SqlQuery("select cat_name from category order by cat_name")
        Category.Items.Clear()
        Category.Items.Add("ALL")
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            Category.Items.Add(dtCommon.Rows(x).Item(0).ToString)
        Next
    End Sub

    Public Sub LoadSupply()
        If Stock.Text = "ALL" Then
            SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid ORDER BY b.datestock DESC")
            RadGrid1.DataSource = dtCommon
            RadGrid1.DataBind()
        Else
            SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and b.stock='" & Stock.Text & "' ORDER BY b.datestock DESC")
            RadGrid1.DataSource = dtCommon
            RadGrid1.DataBind()
        End If
    End Sub
    Private Sub Category_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Category.SelectedIndexChanged
        If RadTextBox1.Text = Nothing And Category.Text = "ALL" Then
            LoadSupply()
        ElseIf Category.Text = "ALL" And RadTextBox1.Text <> Nothing Then
            If Stock.Text = "ALL" Then
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.itemname like '" & RadTextBox1.Text & "%' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            Else
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.itemname like '" & RadTextBox1.Text & "%' and b.stock='" & Stock.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            End If
        ElseIf Category.Text <> "ALL" And RadTextBox1.Text = Nothing Then
            If Stock.Text = "ALL" Then
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.category='" & Category.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            Else
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.category='" & Category.Text & "' and b.stock='" & Stock.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            End If
        ElseIf Category.Text <> "ALL" And RadTextBox1.Text <> Nothing Then
            If Stock.Text = "ALL" Then
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.itemname like '" & RadTextBox1.Text & "%' and a.category='" & Category.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            Else
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.itemname like '" & RadTextBox1.Text & "%' and a.category='" & Category.Text & "' and b.stock='" & Stock.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            End If
        End If
    End Sub

    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click
        If RadTextBox1.Text = Nothing And Category.Text = "ALL" Then
            LoadSupply()
        ElseIf Category.Text = "ALL" And RadTextBox1.Text <> Nothing Then
            If Stock.Text = "ALL" Then
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.itemname like '" & RadTextBox1.Text & "%' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            Else
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.itemname like '" & RadTextBox1.Text & "%' and b.stock='" & Stock.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            End If
        ElseIf Category.Text <> "ALL" And RadTextBox1.Text = Nothing Then
            If Stock.Text = "ALL" Then
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.category='" & Category.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            Else
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.category='" & Category.Text & "' and b.stock='" & Stock.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            End If
        ElseIf Category.Text <> "ALL" And RadTextBox1.Text <> Nothing Then
            If Stock.Text = "ALL" Then
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.itemname like '" & RadTextBox1.Text & "%' and a.category='" & Category.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            Else
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.itemname like '" & RadTextBox1.Text & "%' and a.category='" & Category.Text & "' and b.stock='" & Stock.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            End If
        End If




        SpreadsheetInfo.SetLicense("E5M9-UYGW-HF3O-VETZ")
        Dim path As String = Server.MapPath("~\ToPrint\")
        Dim NameOfFile As String = path & "StockLogs.xlsx"

        Dim WB As ExcelFile = ExcelFile.Load(NameOfFile)
        Dim WS As ExcelWorksheet = WB.Worksheets.ActiveWorksheet
        WS.Cells.Style.ShrinkToFit = True

        WS.InsertDataTable(dtCommon, New InsertDataTableOptions("A11"))

        Dim Filename As String = "StockLogs_" & Format(DateTime.Now, "MMddyyyy_HHmmss") & ".pdf"
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

    Private Sub Stock_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Stock.SelectedIndexChanged
        If RadTextBox1.Text = Nothing And Category.Text = "ALL" Then
            LoadSupply()
        ElseIf Category.Text = "ALL" And RadTextBox1.Text <> Nothing Then
            If Stock.Text = "ALL" Then
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.itemname like '" & RadTextBox1.Text & "%' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            Else
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.itemname like '" & RadTextBox1.Text & "%' and b.stock='" & Stock.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            End If
        ElseIf Category.Text <> "ALL" And RadTextBox1.Text = Nothing Then
            If Stock.Text = "ALL" Then
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.category='" & Category.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            Else
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.category='" & Category.Text & "' and b.stock='" & Stock.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            End If
        ElseIf Category.Text <> "ALL" And RadTextBox1.Text <> Nothing Then
            If Stock.Text = "ALL" Then
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.itemname like '" & RadTextBox1.Text & "%' and a.category='" & Category.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            Else
                SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and a.itemname like '" & RadTextBox1.Text & "%' and a.category='" & Category.Text & "' and b.stock='" & Stock.Text & "' ORDER BY b.datestock DESC")
                RadGrid1.DataSource = dtCommon
                RadGrid1.DataBind()
            End If
        End If
    End Sub
End Class
