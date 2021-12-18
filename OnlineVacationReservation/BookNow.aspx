<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookNow.aspx.cs" Inherits="OnlineVacationReservation._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Site.css" rel="stylesheet" />
    <div class="jumbotron">
        <h1 align="center"><tt>Jamaica Tourist Board</tt></h1>
        <p align="center" class="lead"><i>Explore Our World</i></p>
        <p>&nbsp;</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Flights</h2>
            <p>
                We are a land of unique culture, engaging activities, breathtaking landscapes, and a warm, welcoming people.
            </p>
            <p>
                &nbsp;<asp:Button ID="flightBook" runat="server" CssClass="button" Text="Book Today" OnClick="flightbook" />
            </p>
        </div>
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
            <h2>Cruises</h2>
            <p>
                Enjoy our cruises that has unbeatable prices! No place on earth provides the range of attractions and the 
                cultural diversity that can be found here. 
            </p>
            <p>
                &nbsp;<asp:Button ID="Button2" runat="server" CssClass="button" Text="Book Today" OnClick="Button2_Click" />
            </p>
        </div>
    </div>

</asp:Content>
