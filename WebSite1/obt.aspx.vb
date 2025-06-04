Imports System.Data
Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient

Partial Class obt
    Inherits System.Web.UI.Page

    Dim conn As New MySqlConnection("server=localhost;user=root;password=;database=apotek4husada")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            TampilkanData()
        Else
            ' Hapus script jika bukan aksi simpan/update/delete
            ltlScript.Text = ""
        End If
    End Sub


    Protected Sub btnSimpan_Click(sender As Object, e As EventArgs) Handles btnSimpan.Click
        If Not IsNumeric(txtHarga.Text) Or Not IsNumeric(txtStok.Text) Then
            ltlScript.Text = "<script>Swal.fire('Gagal!', 'Harga dan Stok harus berupa angka.', 'error');</script>"
            Return
        End If

        conn.Open()

        ' Cek apakah data obat sudah ada
        Dim cekCmd As New MySqlCommand("SELECT COUNT(*) FROM obat WHERE nama_obat = @nama AND jenis_obat = @jenis AND harga = @harga AND stok = @stok", conn)
        cekCmd.Parameters.AddWithValue("@nama", txtNamaObat.Text.Trim())
        cekCmd.Parameters.AddWithValue("@jenis", ddlJenisObat.SelectedValue)
        cekCmd.Parameters.AddWithValue("@harga", txtHarga.Text.Trim())
        cekCmd.Parameters.AddWithValue("@stok", txtStok.Text.Trim())

        Dim jumlah As Integer = Convert.ToInt32(cekCmd.ExecuteScalar())

        If jumlah > 0 Then
            ' Data duplikat ditemukan
            ltlScript.Text = "<script>Swal.fire('Gagal!', 'Obat dengan data yang sama sudah ada di database.', 'warning');</script>"
            conn.Close()
            Return
        End If

        ' Jika tidak ada duplikat, lanjut simpan
        Dim cmd As New MySqlCommand("INSERT INTO obat (nama_obat, jenis_obat, harga, stok) VALUES (@nama, @jenis, @harga, @stok)", conn)
        cmd.Parameters.AddWithValue("@nama", txtNamaObat.Text.Trim())
        cmd.Parameters.AddWithValue("@jenis", ddlJenisObat.SelectedValue)
        cmd.Parameters.AddWithValue("@harga", txtHarga.Text.Trim())
        cmd.Parameters.AddWithValue("@stok", txtStok.Text.Trim())
        cmd.ExecuteNonQuery()
        conn.Close()

        ltlScript.Text = "<script>Swal.fire('Sukses!', 'Data berhasil disimpan.', 'success');</script>"

        TampilkanData()
        KosongkanForm()
    End Sub


    Protected Sub btnTampil_Click(sender As Object, e As EventArgs) Handles btnTampil.Click
        TampilkanData()
    End Sub

    Protected Sub btnCari_Click(sender As Object, e As EventArgs) Handles btnCari.Click
        conn.Open()
        Dim cmd As New MySqlCommand("SELECT * FROM obat WHERE nama_obat LIKE @nama", conn)
        cmd.Parameters.AddWithValue("@nama", "%" & txtCari.Text & "%")
        Dim da As New MySqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        GridView1.DataSource = dt
        GridView1.DataBind()
        conn.Close()
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim idObat As String = GridView1.DataKeys(e.RowIndex).Value.ToString()
        conn.Open()
        Dim cmd As New MySqlCommand("DELETE FROM obat WHERE id_obat = @id", conn)
        cmd.Parameters.AddWithValue("@id", idObat)
        cmd.ExecuteNonQuery()
        conn.Close()

        ltlScript.Text = "<script>Swal.fire('Dihapus!', 'Data berhasil dihapus.', 'success');</script>"

        TampilkanData()
    End Sub

    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        TampilkanData()
    End Sub

    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        GridView1.EditIndex = -1
        TampilkanData()
    End Sub

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim idObat As String = GridView1.DataKeys(e.RowIndex).Value.ToString()
        Dim row As GridViewRow = GridView1.Rows(e.RowIndex)

        Dim nama As String = CType(row.Cells(1).Controls(0), TextBox).Text.Trim()
        Dim jenis As String = CType(row.Cells(2).Controls(0), TextBox).Text.Trim()
        Dim harga As String = CType(row.Cells(3).Controls(0), TextBox).Text.Trim()
        Dim stok As String = CType(row.Cells(4).Controls(0), TextBox).Text.Trim()

        If Not IsNumeric(harga) Or Not IsNumeric(stok) Then
            ltlScript.Text = "<script>Swal.fire('Gagal!', 'Harga dan Stok harus berupa angka.', 'error');</script>"
            Return
        End If

        conn.Open()

        ' Cek apakah data yang diinput sudah ada (kecuali data dengan ID yang sedang diupdate)
        Dim cekCmd As New MySqlCommand("SELECT COUNT(*) FROM obat WHERE nama_obat=@nama AND jenis_obat=@jenis AND harga=@harga AND stok=@stok AND id_obat <> @id", conn)
        cekCmd.Parameters.AddWithValue("@nama", nama)
        cekCmd.Parameters.AddWithValue("@jenis", jenis)
        cekCmd.Parameters.AddWithValue("@harga", harga)
        cekCmd.Parameters.AddWithValue("@stok", stok)
        cekCmd.Parameters.AddWithValue("@id", idObat)

        Dim jumlah As Integer = Convert.ToInt32(cekCmd.ExecuteScalar())

        If jumlah > 0 Then
            ltlScript.Text = "<script>Swal.fire('Gagal!', 'Data obat dengan nilai yang sama sudah ada.', 'warning');</script>"
            conn.Close()
            Return
        End If

        ' Update jika tidak duplikat
        Dim cmd As New MySqlCommand("UPDATE obat SET nama_obat=@nama, jenis_obat=@jenis, harga=@harga, stok=@stok WHERE id_obat=@id", conn)
        cmd.Parameters.AddWithValue("@nama", nama)
        cmd.Parameters.AddWithValue("@jenis", jenis)
        cmd.Parameters.AddWithValue("@harga", harga)
        cmd.Parameters.AddWithValue("@stok", stok)
        cmd.Parameters.AddWithValue("@id", idObat)
        cmd.ExecuteNonQuery()
        conn.Close()

        ltlScript.Text = "<script>Swal.fire('Tersimpan!', 'Data berhasil diperbarui.', 'success');</script>"

        GridView1.EditIndex = -1
        TampilkanData()
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow AndAlso GridView1.EditIndex <> e.Row.RowIndex Then
            ' Kolom harga = index ke-3 (karena urut dari 0: id, nama, jenis, harga)
            Dim hargaCell As TableCell = e.Row.Cells(3)
            Dim hargaValue As Decimal

            If Decimal.TryParse(hargaCell.Text, hargaValue) Then
                hargaCell.Text = "Rp. " & Format(hargaValue, "#,##0")
            End If
        End If
    End Sub

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        TampilkanData()
    End Sub


    Private Sub TampilkanData()
        conn.Open()
        Dim cmd As New MySqlCommand("SELECT * FROM obat", conn)
        Dim da As New MySqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        GridView1.DataSource = dt
        GridView1.DataKeyNames = New String() {"id_obat"}
        GridView1.DataBind()
        conn.Close()
    End Sub

    Private Sub KosongkanForm()

        txtNamaObat.Text = ""
        txtHarga.Text = ""
        txtStok.Text = ""
        ddlJenisObat.SelectedIndex = 0
    End Sub

End Class
