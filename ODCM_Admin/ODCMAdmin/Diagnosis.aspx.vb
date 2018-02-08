Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Partial Class Diagnosis
    Inherits System.Web.UI.Page

    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource
        RadGrid1.DataSource = Nothing
        If RadTextBox1.Text = Nothing Then
            SqlQuery("select clientid,LastName,FirstName,MiddleName from ClientTbl where IsVerified=1 and role='User' order by LastName")
        Else
            SqlQuery("select clientid,LastName,FirstName,MiddleName from ClientTbl where (LastName like '" & RadTextBox1.Text & "%' or FirstName like '" & RadTextBox1.Text & "%' or MiddleName like '" & RadTextBox1.Text & "%') and IsVerified=1 and role='User' order by LastName")
        End If
        RadGrid1.DataSource = dtCommon
    End Sub
    Private Sub ClientList_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If
    End Sub

    Private Sub RadTextBox1_TextChanged(sender As Object, e As EventArgs) Handles RadTextBox1.TextChanged
        Dim a As GridNeedDataSourceEventArgs
        RadGrid1_NeedDataSource(sender, a)
        RadGrid1.Rebind()
    End Sub

    Private Sub RadGrid1_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGrid1.ItemCommand
        If e.CommandName = "View" Then
            Dim item As GridDataItem = CType(e.Item, GridDataItem)
            Dim ID As String = item("ID").Text
            Session("ClientID") = ID
            Response.Redirect("PatientRecord.aspx")
        End If
    End Sub

End Class
