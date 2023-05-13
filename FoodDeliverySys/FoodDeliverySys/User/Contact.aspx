<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FoodDeliverySys.User.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <!-- book section -->
  <section class="book_section layout_padding">
    <div class="container">
      <div class="heading_container">
        <h2>
          Здесь Вы можете оставить отзыв
        </h2>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="form_container">
            <form action="">
              <div>
                <input type="text" class="form-control" placeholder="Ваше имя" />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Тема отзыва" />
              </div>
              <div>
                <textarea class="form-control" placeholder="Ваше сообщение..." >
                </textarea>
              </div>
              <div class="btn_box">
                <button>
                  Отправить
                </button>
              </div>
            </form>
          </div>
        </div>
        <div class="col-md-6">
         
        </div>
      </div>
    </div>
  </section>
  <!-- end book section -->

</asp:Content>
