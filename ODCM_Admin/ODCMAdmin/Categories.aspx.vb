﻿Imports SQLUtilities.LabelmanUtilities
Imports Telerik.Web.UI
Imports System.Drawing
Imports Microsoft.VisualBasic
Imports System
Imports System.Collections
Partial Class Service
    Inherits System.Web.UI.Page

    Protected Sub RadGrid_ItemCreated(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid1.ItemCreated
        Dim id As String
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If Not (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                Dim editor As GridTextBoxColumnEditor = TryCast(manager.GetColumnEditor("cat_id"), GridTextBoxColumnEditor)
                editor.TextBoxControl.Enabled = False
                id = editor.Text
            End If
            If (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                Dim editor As GridTextBoxColumnEditor = TryCast(manager.GetColumnEditor("cat_id"), GridTextBoxColumnEditor)
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
                ID = TryCast(manager.GetColumnEditor("cat_id"), GridTextBoxColumnEditor)
                serviceid = ID.Text
                Services = TryCast(manager.GetColumnEditor("cat_name"), GridTextBoxColumnEditor)
                Services.TextBoxControl.Enabled = True
                product = Services.Text
                SqlQuery("insert into odcmdb.category(cat_name) values('" & product & "')")
                RadGrid1.MasterTableView.ClearEditItems()
                RadGrid1.MasterTableView.IsItemInserted = False
                RadGrid1.MasterTableView.Rebind()
                Response.Redirect("Categories.aspx")
            End If
        End If
    End Sub

    Protected Sub RadGrid_ItemDeleted(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.DeleteCommand

        Dim item As GridDataItem = e.Item
        Dim str1 As String = item("cat_id").Text

        'Dim ID, Services As GridTextBoxColumnEditor
        'Dim serviceid, product As String


        'Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
        'Dim manager As GridEditManager = item.EditManager



        'ID = TryCast(manager.GetColumnEditor("uom_id"), GridTextBoxColumnEditor)
        'serviceid = ID.Text
        'Services = TryCast(manager.GetColumnEditor("uom_name"), GridTextBoxColumnEditor)
        'Services.TextBoxControl.Enabled = True
        'product = Services.Text
        SqlQuery("delete from category where cat_id='" & str1 & "'")
        RadGrid1.MasterTableView.ClearEditItems()
        RadGrid1.Rebind()
        Response.Redirect("Categories.aspx")



    End Sub

    Protected Sub RadGrid_ItemUpdated(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.EditCommand
        Dim ID, Services As GridTextBoxColumnEditor
        Dim serviceid, product As String
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            If Not (TypeOf e.Item Is GridEditFormInsertItem) Then
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim manager As GridEditManager = item.EditManager
                ID = TryCast(manager.GetColumnEditor("cat_id"), GridTextBoxColumnEditor)
                serviceid = ID.Text
                Services = TryCast(manager.GetColumnEditor("cat_name"), GridTextBoxColumnEditor)
                Services.TextBoxControl.Enabled = True
                product = Services.Text
                SqlQuery("update category set cat_name='" & product & "' where cat_id='" & serviceid & "'")
                RadGrid1.MasterTableView.ClearEditItems()
                RadGrid1.Rebind()
                Response.Redirect("Categories.aspx")
            End If
        End If
    End Sub



    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource
        If RadTextBox1.Text = Nothing Then
            SqlQuery("Select cat_id, cat_name from category order by cat_name")
            RadGrid1.DataSource = dtCommon
        Else
            SqlQuery("Select cat_id, cat_name from category where cat_name like '" & RadTextBox1.Text & "%' order by cat_name")
            RadGrid1.DataSource = dtCommon
        End If
    End Sub

    Private Sub RadTextBox1_TextChanged(sender As Object, e As EventArgs) Handles RadTextBox1.TextChanged
        Dim a As GridNeedDataSourceEventArgs
        RadGrid1_NeedDataSource(sender, a)
        RadGrid1.Rebind()
    End Sub


End Class
