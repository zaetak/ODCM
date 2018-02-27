
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
Partial Class PatientGraph
    Inherits System.Web.UI.Page


    Private Sub PatientGraph_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If


        If IsPostBack = False Then
            RadHtmlChart1.Visible = False
            Dim path As String = Server.MapPath("~/ToPrint/file")
            RadClientExportManager1.PdfSettings.ProxyURL = ResolveUrl(path)
            RadClientExportManager1.PdfSettings.Author = "DENTCAST"
        End If
    End Sub

    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click
        SpreadsheetInfo.SetLicense("E5M9-UYGW-HF3O-VETZ")

        If Sex.Text = "All" Then
            RadHtmlChart1.ChartTitle.Text = Sex.Text & " Patient Ages " & txtfrom.Text & " to " & txtto.Text
            SqlQuery("Select clientid,Gender,count(Age) as 'Age' from clienttbl where age between '" & txtfrom.Text & "' and '" & txtto.Text & "' and role='User' group by gender")

        Else
            RadHtmlChart1.ChartTitle.Text = Sex.Text & " Patient Ages " & txtfrom.Text & " to " & txtto.Text
            SqlQuery("Select clientid,Gender,count(Age) as 'Age' from clienttbl where age between '" & txtfrom.Text & "' and '" & txtto.Text & "' and role='User' and gender='" & Sex.Text & "' group by gender")

        End If

        Dim path As String = Server.MapPath("~/ToPrint/")
        Dim NameOfFile As String = path & "PatientGraph.xlsx"
        Dim Filename As String = "PatientGraph_" & Format(DateTime.Now, "MMddyyyy") & ".pdf"
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

        WB.Save(Server.MapPath("~/ToPrint/PatientGraph_" & Format(DateTime.Now, "MMddyyyy") & ".xlsx"))

        Dim WB1 As ExcelFile = ExcelFile.Load(Server.MapPath("~/ToPrint/PatientGraph_" & Format(DateTime.Now, "MMddyyyy") & ".xlsx"))
        WB1.Save(Server.MapPath("~/ToPrint/PatientGraph_" & Format(DateTime.Now, "MMddyyyy") & ".pdf"))
        Dim FP As String = Server.MapPath("~/ToPrint/PatientGraph_" & Format(DateTime.Now, "MMddyyyy") & ".pdf")
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

    Private Function GetData() As DataSet
        Dim ds As New DataSet("Stocked")
        If Sex.Text = "All" Then
            RadHtmlChart1.ChartTitle.Text = Sex.Text & " Patient Ages " & txtfrom.Text & " to " & txtto.Text
            SqlQuery("Select clientid,Gender,count(Age) as 'Age' from clienttbl where age between '" & txtfrom.Text & "' and '" & txtto.Text & "' and role='User' group by gender")
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontFamily = "Century Gothic"
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.Bold = True
            RadHtmlChart1.ChartTitle.Appearance.TextStyle.FontSize = 18
        Else
            RadHtmlChart1.ChartTitle.Text = Sex.Text & " Patient Ages " & txtfrom.Text & " to " & txtto.Text
            SqlQuery("Select clientid,Gender,count(Age) as 'Age' from clienttbl where age between '" & txtfrom.Text & "' and '" & txtto.Text & "' and role='User' and gender='" & Sex.Text & "' group by gender")
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

    Protected Sub txtfrom_TextChanged(sender As Object, e As EventArgs) Handles txtfrom.TextChanged
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub

    Private Sub txtto_TextChanged(sender As Object, e As EventArgs) Handles txtto.TextChanged
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub

    Private Sub Sex_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles Sex.SelectedIndexChanged
        If dtCommon.Rows.Count = 0 Then
            RadHtmlChart1.Visible = False
        Else
            RadHtmlChart1.Visible = True
            RadHtmlChart1.DataSource = GetData()
            RadHtmlChart1.DataBind()
        End If
    End Sub
End Class
