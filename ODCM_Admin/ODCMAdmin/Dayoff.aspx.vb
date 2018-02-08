Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports System.Drawing
Imports Microsoft.VisualBasic
Imports System
Imports System.Collections
Imports Telerik.Web.UI.Calendar

Partial Class ODCMAdmin_Dayoff
    Inherits System.Web.UI.Page
    Protected Sub RadGrid_ItemCreated(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid1.ItemCreated
        Dim Remarks As GridTextBoxColumnEditor
        Dim DateOff As GridTemplateColumnEditor
        Dim DateOff1 As RadDatePicker
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If Not (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                Remarks = TryCast(manager.GetColumnEditor("Remarks"), GridTextBoxColumnEditor)
                DateOff = CType(manager.GetColumnEditor("DateOff"), GridTemplateColumnEditor)
                ' ID.TextBoxControl.Enabled = False
                DateOff1 = item.FindControl("RadDatePicker1")
            End If
            If (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                Remarks = TryCast(manager.GetColumnEditor("Remarks"), GridTextBoxColumnEditor)
                DateOff = CType(manager.GetColumnEditor("DateOff"), GridTemplateColumnEditor)
                'ID.TextBoxControl.Enabled = False
                DateOff1 = item.FindControl("RadDatePicker1")
            End If
        End If
    End Sub
    Protected Sub RadGrid_InsertCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.InsertCommand
        Dim Remarks As GridTextBoxColumnEditor
        Dim DateOff As GridTemplateColumnEditor
        Dim DateOff1 As RadDatePicker
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                Remarks = TryCast(manager.GetColumnEditor("Remarks"), GridTextBoxColumnEditor)
                DateOff = CType(manager.GetColumnEditor("DateOff"), GridTemplateColumnEditor)
                DateOff1 = item.FindControl("RadDatePicker1")
                SqlQuery("insert into dayofftbl(dateoff,remarks) values('" & Format(DateOff1.SelectedDate, "yyyy-MM-dd") & "','" & Remarks.Text & "')")
                RadGrid1.MasterTableView.ClearEditItems()
                RadGrid1.MasterTableView.IsItemInserted = False
                RadGrid1.MasterTableView.Rebind()
                Response.Redirect("DayOff.aspx")
            End If
        End If
    End Sub

    Protected Sub RadGrid_ItemDeleted(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.DeleteCommand

        Dim item As GridDataItem = e.Item
        Dim str1 As String = item("ID").Text
        SqlQuery("delete from dayofftbl where id='" & str1 & "'")
        RadGrid1.MasterTableView.ClearEditItems()
        RadGrid1.Rebind()
        Response.Redirect("DayOff.aspx")
    End Sub

    Protected Sub RadGrid_ItemUpdated(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.EditCommand
        Dim Remarks, ID As GridTextBoxColumnEditor
        Dim DateOff As GridTemplateColumnEditor
        Dim DateOff1 As RadDatePicker
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If Not (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                ID = TryCast(manager.GetColumnEditor("ID"), GridTextBoxColumnEditor)
                Remarks = TryCast(manager.GetColumnEditor("Remarks"), GridTextBoxColumnEditor)
                DateOff = CType(manager.GetColumnEditor("DateOff"), GridTemplateColumnEditor)
                ID.TextBoxControl.Enabled = False
                DateOff1 = item.FindControl("RadDatePicker1")
                SqlQuery("update dayofftbl set dateoff='" & Format(DateOff1.SelectedDate, "yyyy-MM-dd") & "',remarks='" & Remarks.Text & "' where ID='" & ID.Text & "'")
                RadGrid1.MasterTableView.ClearEditItems()
                RadGrid1.Rebind()
                Response.Redirect("DayOff.aspx")
            End If
        End If
    End Sub



    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource
        If RadDatePicker1.SelectedDate.Value.Date = Date.Now.Date Then
            SqlQuery("SELECT id,DATE_FORMAT(dateoff,'%M %d, %Y') as 'DateOff',remarks FROM dayofftbl ORDER BY dateoff DESC")
            RadGrid1.DataSource = dtCommon
        Else
            SqlQuery("SELECT id,DATE_FORMAT(dateoff,'%M %d, %Y') as 'DateOff',remarks FROM dayofftbl where dateoff='" & RadDatePicker1.SelectedDate & "' order by dateoff desc")
            RadGrid1.DataSource = dtCommon
        End If
    End Sub

    Private Sub RadDatePicker1_SelectedDateChanged(sender As Object, e As SelectedDateChangedEventArgs) Handles RadDatePicker1.SelectedDateChanged
        Dim a As GridNeedDataSourceEventArgs
        RadGrid1_NeedDataSource(sender, a)
        RadGrid1.Rebind()
    End Sub

    Private Sub ODCMAdmin_Dayoff_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If
        If IsPostBack = False Then
            RadDatePicker1.SelectedDate = Date.Now
        End If
    End Sub
End Class
