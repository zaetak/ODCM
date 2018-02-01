
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

    Private Sub SupplyGraph_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If


        If IsPostBack = False Then
            Dim theDate As Date = Date.Now
            Dim yearLater As Date = theDate.AddYears(-1)
            RadDatePicker1.SelectedDate = yearLater
            RadDatePicker2.SelectedDate = Date.Now
            Category.Text = "Yearly"
            RadioButton1.Checked = True
            TextBox1.Text = "IN"
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
            Dim c As CultureInfo = RadDatePicker1.Calendar.CultureInfo
            TextBox2.Text = c.Calendar.GetWeekOfYear(RadDatePicker1.SelectedDate, c.DateTimeFormat.CalendarWeekRule, c.DateTimeFormat.FirstDayOfWeek)
            Dim d As CultureInfo = RadDatePicker2.Calendar.CultureInfo
            TextBox3.Text = d.Calendar.GetWeekOfYear(RadDatePicker2.SelectedDate, d.DateTimeFormat.CalendarWeekRule, d.DateTimeFormat.FirstDayOfWeek)
            Dim path As String = Server.MapPath("~/ToPrint/file")
            RadClientExportManager1.PdfSettings.ProxyURL = ResolveUrl(path)
            RadClientExportManager1.PdfSettings.Author = "DENTCAST"
        End If
    End Sub


    Private Function GetData() As DataSet
        Dim ds As New DataSet("Stocked")
        Dim c As CultureInfo = RadDatePicker1.Calendar.CultureInfo
        TextBox2.Text = c.Calendar.GetWeekOfYear(RadDatePicker1.SelectedDate, c.DateTimeFormat.CalendarWeekRule, c.DateTimeFormat.FirstDayOfWeek)
        Dim d As CultureInfo = RadDatePicker2.Calendar.CultureInfo
        TextBox3.Text = d.Calendar.GetWeekOfYear(RadDatePicker2.SelectedDate, d.DateTimeFormat.CalendarWeekRule, d.DateTimeFormat.FirstDayOfWeek)
        If Category.Text = "Daily" Then
            RadHtmlChart1.ChartTitle.Text = Category.Text & " Stock " & TextBox1.Text & " from " & Format(RadDatePicker1.SelectedDate, "MMMM dd, yyyy").ToString & " to " & Format(RadDatePicker2.SelectedDate, "MMMM dd, yyyy").ToString
            SqlQuery("select a.id,b.itemname as 'Name',sum(a.quantity) as 'Quantity' from suppliesinouttbl a, suppliestbl b where a.supplyid=b.supplyid and a.stock='" & TextBox1.Text & "' and a.datestock between '" & Format(RadDatePicker1.SelectedDate, "yyyy-MM-dd") & "' and '" & Format(RadDatePicker2.SelectedDate, "yyyy-MM-dd") & "' group by b.itemname order by a.quantity")
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
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub

End Class
