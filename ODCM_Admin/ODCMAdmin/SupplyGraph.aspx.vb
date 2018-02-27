
Imports System.Globalization
Imports Telerik.Web.UI.Calendar
Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports System.Drawing
Imports Microsoft.VisualBasic
Imports System
Imports System.IO
Imports System.Collections
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
Imports GemBox.Spreadsheet.Charts
Partial Class SupplyGraph
    Inherits System.Web.UI.Page
    Private Sub RadDatePicker2_SelectedDateChanged(sender As Object, e As SelectedDateChangedEventArgs) Handles RadDatePicker2.SelectedDateChanged


        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub

    'Public Sub OnClientSeriesClicked(sender As Object, e As EventArgs)
    '    ShowGraphData("try")
    'End Sub

    Public Sub ShowGraphData(ByVal category As String)
        If RadioButton1.Checked = True Then
            TextBox1.Text = "IN"
        End If
        If RadioButton2.Checked = True Then
            TextBox1.Text = "OUT"
        End If
        SqlQuery("SELECT  a.invoice,a.Itemname,b.Quantity,a.UOM,a.Category,b.stock,DATE_FORMAT(b.datestock,'%m/%d/%Y') as datestock FROM suppliestbl a,suppliesinouttbl b WHERE a.supplyid=b.supplyid and b.stock='" & TextBox1.Text & "' and a.category='" & category & "' and DATE_FORMAT(b.datestock,'%m/%d/%Y') between '" & Format(RadDatePicker1.SelectedDate, "MM/dd/YYYY") & "' and '" & Format(RadDatePicker2.SelectedDate, "MM/dd/YYYY") & "' ORDER BY b.datestock DESC")
        RadGrid1.DataSource = dtCommon
        RadGrid1.DataBind()
        ModalPopupExtender1.Show()
    End Sub

    Private Sub SupplyGraph_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If
        If IsPostBack = False Then
            Dim theDate As Date = Date.Now
            Dim yearLater As Date = theDate.AddYears(-1)
            RadDatePicker1.SelectedDate = Date.Now
            RadDatePicker2.SelectedDate = yearLater
            Category.Text = "Yearly"
            RadioButton1.Checked = True
            TextBox1.Text = "In"
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
            Dim c As CultureInfo = RadDatePicker1.Calendar.CultureInfo
            TextBox2.Text = c.Calendar.GetWeekOfYear(RadDatePicker1.SelectedDate, c.DateTimeFormat.CalendarWeekRule, c.DateTimeFormat.FirstDayOfWeek)
            Dim d As CultureInfo = RadDatePicker2.Calendar.CultureInfo
            TextBox3.Text = d.Calendar.GetWeekOfYear(RadDatePicker2.SelectedDate, d.DateTimeFormat.CalendarWeekRule, d.DateTimeFormat.FirstDayOfWeek)
            'Dim path As String = Server.MapPath("~/ToPrint/file")
            'RadClientExportManager1.PdfSettings.ProxyURL = ResolveUrl(path)
            'RadClientExportManager1.PdfSettings.Author = "DENTCAST"
        End If
    End Sub


    Private Function GetData() As DataSet
        Dim ds As New DataSet("Stocked")
        Dim c As CultureInfo = RadDatePicker1.Calendar.CultureInfo
        TextBox2.Text = c.Calendar.GetWeekOfYear(RadDatePicker1.SelectedDate, c.DateTimeFormat.CalendarWeekRule, c.DateTimeFormat.FirstDayOfWeek)
        Dim d As CultureInfo = RadDatePicker2.Calendar.CultureInfo
        TextBox3.Text = d.Calendar.GetWeekOfYear(RadDatePicker2.SelectedDate, d.DateTimeFormat.CalendarWeekRule, d.DateTimeFormat.FirstDayOfWeek)
        If Category.Text = "Daily" Then
            RadHtmlChart1.ChartTitle.Text = Category.Text & " Stock " & TextBox1.Text & " from " & Format(RadDatePicker1.SelectedDate, "MMMM dd, yyyy").ToString & " To " & Format(RadDatePicker2.SelectedDate, "MMMM dd, yyyy").ToString
            SqlQuery("Select a.id, b.itemname as 'Name',sum(a.quantity) as 'Quantity' from suppliesinouttbl a, suppliestbl b where a.supplyid=b.supplyid and a.stock='" & TextBox1.Text & "' and a.datestock between '" & Format(RadDatePicker1.SelectedDate, "yyyy-MM-dd") & "' and '" & Format(RadDatePicker2.SelectedDate, "yyyy-MM-dd") & "' group by b.itemname order by a.quantity")
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontFamily = "Century Gothic"
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.Bold = True
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontSize = 18
        ElseIf Category.Text = "Weekly" Then
            RadHtmlChart1.ChartTitle.Text = Category.Text & " Stock " & TextBox1.Text & " from WEEK " & TextBox2.Text & " to WEEK " & TextBox3.Text
            SqlQuery("Select a.id, b.itemname as 'Name',sum(a.quantity) as 'Quantity' from suppliesinouttbl a, suppliestbl b where a.supplyid=b.supplyid and a.stock='" & TextBox1.Text & "' and WEEK(a.datestock,2) between '" & TextBox2.Text & "' and '" & TextBox3.Text & "' group by b.itemname order by a.quantity")
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontFamily = "Century Gothic"
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.Bold = True
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontSize = 18
        ElseIf Category.Text = "Monthly" Then
            RadHtmlChart1.ChartTitle.Text = Category.Text & " Stock " & TextBox1.Text & " from " & Format(RadDatePicker1.SelectedDate, "MMMM").ToString & " to " & Format(RadDatePicker2.SelectedDate, "MMMM").ToString
            SqlQuery("select a.id,b.itemname as 'Name',sum(a.quantity) as 'Quantity' from suppliesinouttbl a, suppliestbl b where a.supplyid=b.supplyid and a.stock='" & TextBox1.Text & "' and month(a.datestock) between '" & Format(RadDatePicker1.SelectedDate, "MM") & "' and '" & Format(RadDatePicker2.SelectedDate, "MM") & "' group by b.itemname order by a.quantity")
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontFamily = "Century Gothic"
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.Bold = True
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontSize = 18
        ElseIf Category.Text = "Yearly" Then
            RadHtmlChart1.ChartTitle.Text = Category.Text & " Stock " & TextBox1.Text & " from " & Format(RadDatePicker1.SelectedDate, "yyyy").ToString & " to " & Format(RadDatePicker2.SelectedDate, "yyyy").ToString
            SqlQuery("select a.id,b.itemname as 'Name',sum(a.quantity) as 'Quantity' from suppliesinouttbl a, suppliestbl b where a.supplyid=b.supplyid and a.stock='" & TextBox1.Text & "' and year(a.datestock) between '" & Format(RadDatePicker1.SelectedDate, "yyyy") & "' and '" & Format(RadDatePicker2.SelectedDate, "yyyy") & "' group by b.itemname order by a.quantity")
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontFamily = "Century Gothic"
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.Bold = True
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontSize = 18
        End If

        ds.Tables.Add(dtCommon)
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
        End If
        Return ds
    End Function


    Private Sub Category_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Category.SelectedIndexChanged
        If Category.Text = "Daily" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddDays(1)
        ElseIf Category.Text = "Weekly" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddDays(7)
        ElseIf Category.Text = "Monthly" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddMonths(1)
        ElseIf Category.Text = "Yearly" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddYears(1)
        End If

        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub

    Private Sub RadioButton1_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton1.CheckedChanged
        If RadioButton1.Checked = True Then
            TextBox1.Text = "IN"
        End If
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub

    Private Sub RadioButton2_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton2.CheckedChanged
        If RadioButton2.Checked = True Then
            TextBox1.Text = "OUT"
        End If
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub

    Private Sub RadDatePicker1_SelectedDateChanged(sender As Object, e As SelectedDateChangedEventArgs) Handles RadDatePicker1.SelectedDateChanged
        If Category.Text = "Daily" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddDays(1)
        ElseIf Category.Text = "Weekly" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddDays(7)
        ElseIf Category.Text = "Monthly" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddMonths(1)
        ElseIf Category.Text = "Yearly" Then
            RadDatePicker2.SelectedDate = RadDatePicker1.SelectedDate.Value.AddYears(1)
        End If

        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub

    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click

        SpreadsheetInfo.SetLicense("E5M9-UYGW-HF3O-VETZ")

        If Category.Text = "Daily" Then
            RadHtmlChart1.ChartTitle.Text = Category.Text & " Stock " & TextBox1.Text & " from " & Format(RadDatePicker1.SelectedDate, "MMMM dd, yyyy").ToString & " To " & Format(RadDatePicker2.SelectedDate, "MMMM dd, yyyy").ToString
            SqlQuery("Select a.id, b.itemname as 'Name',sum(a.quantity) as 'Quantity' from suppliesinouttbl a, suppliestbl b where a.supplyid=b.supplyid and a.stock='" & TextBox1.Text & "' and a.datestock between '" & Format(RadDatePicker1.SelectedDate, "yyyy-MM-dd") & "' and '" & Format(RadDatePicker2.SelectedDate, "yyyy-MM-dd") & "' group by b.itemname order by a.quantity")
        ElseIf Category.Text = "Weekly" Then
            RadHtmlChart1.ChartTitle.Text = Category.Text & " Stock " & TextBox1.Text & " from WEEK " & TextBox2.Text & " to WEEK " & TextBox3.Text
            SqlQuery("Select a.id, b.itemname as 'Name',sum(a.quantity) as 'Quantity' from suppliesinouttbl a, suppliestbl b where a.supplyid=b.supplyid and a.stock='" & TextBox1.Text & "' and WEEK(a.datestock,2) between '" & TextBox2.Text & "' and '" & TextBox3.Text & "' group by b.itemname order by a.quantity")
        ElseIf Category.Text = "Monthly" Then
            RadHtmlChart1.ChartTitle.Text = Category.Text & " Stock " & TextBox1.Text & " from " & Format(RadDatePicker1.SelectedDate, "MMMM").ToString & " to " & Format(RadDatePicker2.SelectedDate, "MMMM").ToString
            SqlQuery("select a.id,b.itemname as 'Name',sum(a.quantity) as 'Quantity' from suppliesinouttbl a, suppliestbl b where a.supplyid=b.supplyid and a.stock='" & TextBox1.Text & "' and month(a.datestock) between '" & Format(RadDatePicker1.SelectedDate, "MM") & "' and '" & Format(RadDatePicker2.SelectedDate, "MM") & "' group by b.itemname order by a.quantity")
        ElseIf Category.Text = "Yearly" Then
            RadHtmlChart1.ChartTitle.Text = Category.Text & " Stock " & TextBox1.Text & " from " & Format(RadDatePicker1.SelectedDate, "yyyy").ToString & " to " & Format(RadDatePicker2.SelectedDate, "yyyy").ToString
            SqlQuery("select a.id,b.itemname as 'Name',sum(a.quantity) as 'Quantity' from suppliesinouttbl a, suppliestbl b where a.supplyid=b.supplyid and a.stock='" & TextBox1.Text & "' and year(a.datestock) between '" & Format(RadDatePicker1.SelectedDate, "yyyy") & "' and '" & Format(RadDatePicker2.SelectedDate, "yyyy") & "' group by b.itemname order by a.quantity")
        End If

        Dim path As String = Server.MapPath("~/ToPrint/")
        Dim NameOfFile As String = path & "SupplyGraph.xlsx"
        Dim Filename As String = "SupplyGraph_" & Format(DateTime.Now, "MMddyyyy") & ".pdf"
        Dim strFileName As String = path & Filename

        Dim WB As ExcelFile = ExcelFile.Load(NameOfFile)
        Dim WS As ExcelWorksheet = WB.Worksheets.ActiveWorksheet
        'WS.Cells.Style.ShrinkToFit = True

        WB.Worksheets.Item(0).Cells("A8").Value = RadHtmlChart1.ChartTitle.Text.ToUpper

        Dim numberOfEmployees = dtCommon.Rows.Count - 1

        WS.NamedRanges("ItemName").Range = WS.Cells.GetSubrangeAbsolute(11, 1, numberOfEmployees + 11, 1)
        WS.NamedRanges("Quantity").Range = WS.Cells.GetSubrangeAbsolute(11, 2, numberOfEmployees + 11, 2)


        For i As Integer = 0 To dtCommon.Rows.Count - 1
            WS.Cells(i + 11, 1).Value = dtCommon.Rows(i).Item(1).ToString
            WS.Cells(i + 11, 2).SetValue(dtCommon.Rows(i).Item(2))
        Next

        If System.IO.File.Exists(strFileName) Then
            System.IO.File.Delete(strFileName)
        End If

        WB.Save(Server.MapPath("~/ToPrint/SupplyGraph_" & Format(DateTime.Now, "MMddyyyy") & ".xlsx"))

        Dim WB1 As ExcelFile = ExcelFile.Load(Server.MapPath("~/ToPrint/SupplyGraph_" & Format(DateTime.Now, "MMddyyyy") & ".xlsx"))
        WB1.Save(Server.MapPath("~/ToPrint/SupplyGraph_" & Format(DateTime.Now, "MMddyyyy") & ".pdf"))
        Dim FP As String = Server.MapPath("~/ToPrint/SupplyGraph_" & Format(DateTime.Now, "MMddyyyy") & ".pdf")
        Dim user As New WebClient
        Dim FB As Byte() = user.DownloadData(FP)
        If Not FB Is Nothing Then
            Response.ClearContent()
            Response.Clear()
            Response.ContentType = "application/pdf"
            Response.AddHeader("content-length", FB.Length.ToString())
            Response.BinaryWrite(FB)
        End If

    End Sub

End Class
