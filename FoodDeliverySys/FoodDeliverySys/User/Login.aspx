<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FoodDeliverySys.User.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Время видимости всплывающего сообщения lblMsg 5 сек. -->
    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <%-- Заголовок формы входа начало --%>
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
                <h2>Вход в профиль</h2>
            </div>
            <%-- Заголовок формы входа конец --%>

            <div class="row">
                <%-- Изображение логина начало --%>
                <div class="col-md-6">
                    <div class="form_container">
                        <img src="../Images/login.png" alt="Alternate Text" width="100%"/>
                    </div>
                </div>
                <%-- Изображение логина вход --%>

                <%-- Форма входа начало --%>
                <div class="col-md-6">
                    <div class="form_container">
                        <%-- Поле имя пользователя начало --%>
                        <div>
                            <%-- Валидация поля --%>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                                ErrorMessage="Имя пользователя является обязательным полем"
                                ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="true">
                            </asp:RequiredFieldValidator>

                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"
                                placeholder="Введите имя пользователя"/>
                        </div>
                        <%-- Поле имя пользователя конец --%>

                        <%-- Поле пароль начало --%>
                        <div>
                            <%-- Валидация поля --%>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                ErrorMessage="Пароль является обязательным полем"
                                ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="true">
                            </asp:RequiredFieldValidator>

                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"
                                placeholder="Введите пароль" TextMode="Password"/>
                        </div>
                        <%-- Поле пароль конец --%>

                        <%-- Кнопка отправки формы начало--%>
                        <div class="btn_box">
                            <asp:Button ID="btnLogin" runat="server" Text="Войти" 
                                CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                                OnClick="btnLogin_Click"/>
                            <span class="pl-3 text-info">
                                Нет аккаунта? Зарегиструйтесь <a href="Registration.aspx" class="badge badge-info">здесь</a>
                            </span>
                        </div>
                        <%-- Кнопка отправки формы конец --%>
                    </div>
                </div>
                <%-- Форма входа конец --%>
            </div>
        </div>
    </section>

</asp:Content>
