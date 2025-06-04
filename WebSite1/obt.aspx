<%@ Page Language="VB" AutoEventWireup="false" CodeFile="obt.aspx.vb" Inherits="obt" %>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <title>Data Obat - Apotek 4 Husada</title>
    <style>
        * {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #f4f4f9;
            height:100vh;
        }

        .container-all {
            width: 100%;
        }

        .navbar-container {
            background-color: #333;
            padding: 10px 0;
        }

        .navbar {
            display: flex;
            justify-content: center;
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

            .navbar li {
                margin: 0;
                gap: 5px;
            }

                .navbar li a {
                    display: block;
                    color: white;
                    text-align: center;
                    padding: 14px 16px;
                    text-decoration: none;
                }

                    .navbar li a:hover {
                        background-color: #575757;
                    }

                    .navbar li a.active {
                        background-color: #4CAF50;
                    }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: white;
            padding: 25px 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            height: 110vh;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
        }

        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin: 10px 5px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

            .btn:hover {
                background-color: #45a049;
            }

        .btn-full-width {
            width: 100%;
            margin: 10px 0;
        }

        .footer {
            text-align: center;
            padding: 15px;
            background-color: #333;
            color: white;
            width: 100%;
            margin-top: 30px;
            bottom: 0px;
        }

        img:hover {
            transform: scale(1.2);
            transition: transform 0.2s ease-in-out;
        }

        .custom-pager {
            text-align: center;
            padding: 20px 0;
        }

            .custom-pager table {
                margin: 0 auto;
                display: flex;
                gap: 8px;
                justify-content: center;
                align-items: center;
            }

            .custom-pager a, .custom-pager span {
                display: inline-block;
                padding: 10px 16px;
                font-size: 16px;
                background-color: #fff;
                color: #333;
                border: 2px solid #ccc;
                border-radius: 12px;
                text-decoration: none;
                transition: background-color 0.3s, color 0.3s;
            }

                .custom-pager a:hover {
                    background-color: #eee;
                }

            .custom-pager span {
                background-color: #00b300; /* Hijau */
                color: white;
                border-color: #00b300;
            }

        .fa-icon-link i {
            cursor: pointer;
            transition: transform 0.2s ease;
            padding: 5px;
        }

            .fa-icon-link i:hover {
                transform: scale(1.3);
            }

        .action-buttons {
            display: inline-flex;
            gap: 10px; /* Jarak antar ikon, bisa disesuaikan */
            align-items: center;
            vertical-align: middle;
        }

            .action-buttons i {
                cursor: pointer;
                transition: transform 0.2s ease;
                padding: 4px;
            }

                .action-buttons i:hover {
                    transform: scale(1.3);
                }
    </style>
</head>
<body>
    <div class="navbar-container">
            <ul class="navbar">
                <li><a href="obt.aspx" class="active">Obat</a></li>
                <li><a href="tentang.aspx">Tentang</a></li>
                <li><a href="kontak.aspx">Kontak</a></li>
            </ul>
        </div>
    <div class="container-all">
        <form id="form1" runat="server">


            <div class="container">
                <h1>Manajemen Data Obat - Apotek 4 Husada</h1>
                <table>
                    <tr>
                        <th>Nama Obat</th>
                        <th>Jenis Obat</th>
                        <th>Harga</th>
                        <th>Stok</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtNamaObat" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlJenisObat" runat="server" CssClass="form-control">
                                <asp:ListItem>Tablet</asp:ListItem>
                                <asp:ListItem>Sirup</asp:ListItem>
                                <asp:ListItem>Kapsul</asp:ListItem>
                                <asp:ListItem>Suspensi</asp:ListItem>
                                <asp:ListItem>Tetes</asp:ListItem>
                                <asp:ListItem>Emulsi</asp:ListItem>
                                <asp:ListItem>Larutan</asp:ListItem>
                                <asp:ListItem>Eliksir</asp:ListItem>
                                <asp:ListItem>Kaplet</asp:ListItem>
                                <asp:ListItem>Pil</asp:ListItem>
                                <asp:ListItem>Puyer</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="txtHarga" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtStok" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>

                </table>

                <asp:Button ID="btnSimpan" runat="server" CssClass="btn btn-full-width" Text="Simpan" />

                <div class="input-group">
                    <asp:TextBox ID="txtCari" runat="server" CssClass="form-control" placeholder="Cari Nama Obat"></asp:TextBox>
                    <asp:Button ID="btnCari" runat="server" CssClass="btn" Text="Cari" />
                    <asp:Button ID="btnTampil" runat="server" CssClass="btn" Text="Tampilkan Semua" />
                </div>

                <asp:Literal ID="ltlScript" runat="server"></asp:Literal>
                <asp:GridView ID="GridView1" runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="id_obat"
                    AllowPaging="True"
                    PageSize="5"
                    OnPageIndexChanging="GridView1_PageIndexChanging"
                    OnRowEditing="GridView1_RowEditing"
                    OnRowUpdating="GridView1_RowUpdating"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowDeleting="GridView1_RowDeleting"
                    OnRowDataBound="GridView1_RowDataBound"
                    CssClass="gridview"
                    PagerStyle-CssClass="custom-pager"
                    PagerSettings-Mode="NumericFirstLast"
                    PagerSettings-PreviousPageText="&#10094;"
                    PagerSettings-NextPageText="&#10095;"
                    PagerSettings-FirstPageText=""
                    PagerSettings-LastPageText="">

                    <Columns>
                        <asp:BoundField DataField="id_obat" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="nama_obat" HeaderText="Nama Obat" />
                        <asp:BoundField DataField="jenis_obat" HeaderText="Jenis Obat" />
                        <asp:BoundField DataField="harga" HeaderText="Harga" />
                        <asp:BoundField DataField="stok" HeaderText="Stok" />
                        <asp:TemplateField HeaderText="Aksi">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" ToolTip="Edit">
                                   <i class="fa-solid fa-pen-to-square fa-lg" style="color:#4CAF50;"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" ToolTip="Delete" OnClientClick="return confirm('Yakin ingin menghapus data ini?');">
                                  <i class="fa-solid fa-trash fa-lg" style="color:#e60000;"></i>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>


                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" ToolTip="Update">
                                    <i class="fa-solid fa-check fa-lg" style="color:#4CAF50;"></i>
                                </asp:LinkButton>
                                &nbsp;
                            <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" ToolTip="Cancel">
                               <i class="fa-solid fa-xmark fa-lg" style="color:#999;"></i>
                            </asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </form>
    </div>
    <div class="footer">
        &copy; 2025 Apotek 4 Husada. All rights reserved
    </div>
</body>
</html>
