Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports System.Drawing
Imports Microsoft.VisualBasic
Imports System
Imports System.Collections
Imports System.IO
Imports System.Data
Partial Class EditPicture
    Inherits System.Web.UI.Page

    Protected Sub RadGrid_ItemDeleted(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.DeleteCommand
        Dim item As GridDataItem = e.Item
        Dim str1 As String = item("picturename").Text
        Dim strFileName As String = Server.MapPath("~/ODCMAdmin/SplashImage/") & str1
        If System.IO.File.Exists(strFileName) Then
            System.IO.File.Delete(strFileName)
        End If
        RadGrid1.MasterTableView.ClearEditItems()
        RadGrid1.Rebind()
        Response.Redirect("EditPicture.aspx")
    End Sub



    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource
        Dim dt As New DataTable
        With dt
            .Columns.Add("id")
            .Columns.Add("picturename")
            .Columns.Add("picture")
        End With
        Dim x As Integer = 1
        For Each files In Directory.GetFiles(Server.MapPath("~/ODCMAdmin/SplashImage"))
            Dim info As FileInfo = New FileInfo(files)
            Dim filename = Path.GetFileName(info.FullName)
            dt.Rows.Add(x, filename, "SplashImage/" & filename)
            x = x + 1
        Next

        RadGrid1.DataSource = dt
    End Sub

    Private Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click
        ModalPopupExtender1.Show()
    End Sub
    Protected Sub btnEdit_Click(sender As Object, e As EventArgs) Handles btnEdit.Click
        Dim fileName = Path.Combine(Server.MapPath("~/ODCMAdmin/SplashImage"), FileUpload1.FileName)
        FileUpload1.SaveAs(fileName)
        RadGrid1.MasterTableView.ClearEditItems()
        RadGrid1.Rebind()
        Response.Redirect("EditPicture.aspx")
    End Sub
End Class
