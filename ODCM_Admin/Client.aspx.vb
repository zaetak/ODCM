Imports CommonUtilities.SQLServer
Imports Telerik.Web.UI
Partial Class TeacherList
    Inherits System.Web.UI.Page

    Public Sub LoadTeacher()
        RadComboBox3.Items.Clear()
        SqlQuery("Select concat(LastName,', ',FirstName,' ',MiddleName) from TeacherList order by LastName")
        RadComboBox3.DataSource = dtCommon
        RadComboBox3.Items.Add("All")
        For x As Integer = 0 To dtCommon.Rows.Count - 1
            RadComboBox3.Items.Add(dtCommon.Rows(x).Item(0).ToString)
        Next
    End Sub

    Protected Sub RadComboBox3_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadComboBox3.SelectedIndexChanged
        If RadComboBox3.Text = "All" Then
            LoadTeacherPerGradeLevel()
        Else
            SqlQuery("Select LastName,FirstName,MiddleName,GradeLevel,Section from viewTeacherPerGradeLevel where concat(LastName,', ',FirstName,' ',MiddleName)='" & RadComboBox3.Text & "'")
            RadGrid1.DataSource = dtCommon
            RadGrid1.DataBind()
        End If
    End Sub

    Public Sub LoadTeacherPerGradeLevel()
        SqlQuery("Select LastName,FirstName,MiddleName,GradeLevel,Section from viewTeacherPerGradeLevel")
        RadGrid1.DataSource = dtCommon
        RadGrid1.DataBind()
    End Sub
    Private Sub TeacherList_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack = False Then
            LoadTeacher()
            LoadTeacherPerGradeLevel()
        End If
    End Sub
End Class
