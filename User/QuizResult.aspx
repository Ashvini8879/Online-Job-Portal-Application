<%@ Page Title="Quiz Result" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="QuizResult.aspx.cs" Inherits="MyJobPortal.User.QuizResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .result-box {
            background: white;
            padding: 40px;
            margin: 50px auto;
            max-width: 600px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            text-align: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .result-box h2 {
            font-size: 28px;
            margin-bottom: 15px;
        }

        .result-message {
            font-size: 20px;
            margin-top: 20px;
        }

        .apply-button {
            margin-top: 30px;
            background-color: #007bff;
            color: white;
            padding: 12px 25px;
            border: none;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
        }

        .apply-button:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="result-box">
        <h2>Quiz Result</h2>
        <asp:Label ID="lblScore" runat="server" Font-Bold="true" Font-Size="20px" />
        <div class="result-message" id="msg" runat="server"></div>
        <asp:Button ID="btnHome" runat="server" CssClass="apply-button" Text="Back to Home" OnClick="btnHome_Click" />
    </div>
</asp:Content>
