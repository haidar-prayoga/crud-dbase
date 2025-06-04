<%@ Page Language="VB" AutoEventWireup="false" CodeFile="tentang.aspx.vb" Inherits="tentang" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tentang - Apotek 4 Husada</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
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

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            text-align: center;
            color: #333;
        }

        p {
            font-size: 16px;
            line-height: 1.6;
            color: #555;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background-color: #333;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar-container">
            <ul class="navbar">
                <li><a href="obt.aspx">Obat</a></li>
                <li><a href="tentang.aspx" class="active">Tentang</a></li>
                <li><a href="kontak.aspx">Kontak</a></li>
            </ul>
        </div>

        <div class="container">
            <h2>Tentang Apotek 4 Husada</h2>

<p>
    <strong>Apotek 4 Husada</strong> adalah apotek modern dan terpercaya yang hadir untuk memenuhi kebutuhan kesehatan masyarakat. Kami menyediakan berbagai jenis obat-obatan, suplemen, alat kesehatan, serta layanan informasi obat yang akurat.
</p>

<p>
    Dengan mengutamakan <strong>pelayanan yang ramah, cepat, dan profesional</strong>, kami berkomitmen untuk menjadi mitra kesehatan terbaik bagi Anda dan keluarga. Apotek 4 Husada melayani resep dokter, konsultasi ringan tentang obat, hingga pembelian obat bebas dengan harga yang kompetitif.
</p>

<p>
    Dikelola oleh tenaga farmasi berpengalaman, kami memastikan bahwa setiap pelanggan mendapatkan informasi yang jelas dan obat yang tepat sesuai kebutuhan. Kami juga terus meningkatkan kualitas layanan dan kenyamanan Anda dalam berbelanja di apotek kami.
</p>

<p>
    <strong>Jam Operasional:</strong><br />
    Senin – Sabtu: 08.00 – 22.00 WIB<br />
    Minggu & Hari Libur: 09.00 – 22.00 WIB
</p>

<p>
    Terima kasih telah mempercayakan kebutuhan kesehatan Anda kepada Apotek 4 Husada.
</p>


        <div class="footer">
            &copy; 2025 Apotek 4 Husada. All rights reserved.
        </div>
    </form>
</body>
</html>
