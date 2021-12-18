<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="OnlineVacationReservation.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Site.css" rel="stylesheet" />
    <h1 align="center"><tt>Welcome to the Jamaica Tourist Board</tt></h1>
    <p align="center" class="lead"><i>"Explore Our World"</i>
    
    <img align="center" src="image/vacation.jpg" width="50%" height="50%" /><br />
    <br />
    </p>
    <asp:Button ID="Button1" runat="server" CssClass="button" Text="See More" style="margin: auto" Width="200px" OnClick="Button1_Click" />
    <br />
    </asp:Content>
