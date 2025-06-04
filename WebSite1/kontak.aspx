<%@ Page Language="VB" AutoEventWireup="false" CodeFile="kontak.aspx.vb" Inherits="kontak" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hubungi Kami - Apotek 4 Husada</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            width: 100%;
            overflow-x: hidden;
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

        form {
            width: 100%;
            height: 110vh;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 16px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
            height: 120px;
        }

        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin: 10px 5px 0 0;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

            .btn:hover {
                background-color: #45a049;
            }

        .info {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            color: #636e72;
        }

            .info p {
                margin: 5px 0;
            }

        .footer {
            text-align: center;
            padding: 20px;
            background-color: #333;
            color: white;
            bottom: 0;
            width: 100%;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="navbar-container">
            <ul class="navbar">
                <li><a href="obt.aspx">Obat</a></li>
                <li><a href="tentang.aspx">Tentang</a></li>
                <li><a href="kontak.aspx" class="active">Kontak</a></li>
            </ul>
        </div>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Hubungi Kami</h1>
            <div class="form-group">
                <label for="nama">Nama Lengkap</label>
                <input type="text" id="nama" name="nama" placeholder="Masukkan nama Anda" />
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Masukkan email Anda" />
            </div>
            <div class="form-group">
                <label for="pesan">Pesan</label>
                <textarea id="pesan" name="pesan" placeholder="Tulis pesan Anda di sini"></textarea>
            </div>
            <div>
                <asp:Button ID="btnKirim" runat="server" CssClass="btn" Text="Kirim Pesan" />
            </div>

            <div class="info">
                <h3>Informasi Kontak</h3>
                <p><strong>Alamat:</strong> Jl. Budi Utomo, Krajan Kidul, Jepang Pakis, Kec. Jati, Kab. Kudus, Jawa Tengah, Indonesia</p>
                <p><strong>Email:</strong> info@apotek4husada.com</p>
                <p><strong>Telepon:</strong> 085183119503</p>
            </div>
        </div>
    </form>
    <div class="footer">
            &copy; 2025 Apotek 4 Husada. All rights reserved.
        </div>
</body>
</html>
