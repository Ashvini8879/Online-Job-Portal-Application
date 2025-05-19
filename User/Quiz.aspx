<%@ Page Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="MyJobPortal.User.Quiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .quiz-container {
            max-width: 800px;
            margin: 30px auto;
            padding: 30px;
            background: linear-gradient(to right, #fdfbfb, #ebedee);
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            font-family: 'Segoe UI', sans-serif;
        }

        .quiz-question {
            margin-bottom: 30px;
            padding: 20px;
            background-color: #fff;
            border-radius: 12px;
            border-left: 5px solid #007BFF;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        }

        .quiz-question strong {
            font-size: 18px;
            color: #333;
            display: block;
            margin-bottom: 15px;
        }

        .quiz-question .aspNet-RadioButtonList label {
            display: inline-block;
            margin-right: 25px;
            font-size: 16px;
            padding-left: 6px;
            position: relative;
        }

        .quiz-question .aspNet-RadioButtonList input[type="radio"] {
            transform: scale(1.2);
            margin-right: 6px;
        }

        .quiz-submit {
            margin-top: 20px;
            background-color: #28a745;
            color: white;
            padding: 12px 25px;
            border: none;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .quiz-submit:hover {
            background-color: #218838;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="quiz-container">
        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
            <ItemTemplate>
                <div class="quiz-question">
                    <strong><%# Eval("QuestionText") %></strong>
                    <asp:RadioButtonList 
                        ID="rblOptions" 
                        runat="server" 
                        RepeatDirection="Horizontal" 
                        CssClass="aspNet-RadioButtonList" />
                    <asp:HiddenField ID="hfCorrect" runat="server" Value='<%# Eval("CorrectOption") %>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Button 
            ID="btnSubmit" 
            runat="server" 
            CssClass="quiz-submit" 
            Text="Submit Quiz" 
            OnClick="btnSubmit_Click" />
    </div>
</asp:Content>
