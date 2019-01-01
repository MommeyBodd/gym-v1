<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="clients" type="java.util.ArrayList" scope="request"/>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Главная страница</title>
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/styles/mainPage.css">
        <script>
            function tableSearch() {
                var phrase = document.getElementById('search');
                var table = document.getElementById('info-table');
                var regPhrase = new RegExp(phrase.value, 'i');
                var flag = false;
                for (var i = 1; i < table.rows.length; i++) {
                    flag = false;
                    for (var j = table.rows[3].cells.length - 1; j >= 1; j--) {
                        flag = regPhrase.test(table.rows[i].cells[j].innerHTML);
                        if (flag) break;
                    }
                    if (flag) {
                        table.rows[i].style.display = "";
                    } else {
                        table.rows[i].style.display = "none";
                    }

                }
            }
        </script>

        <script src="http://code.jquery.com/jquery-2.0.2.min.js"></script>

        <script>
            //----------------------------------------
            $(document).ready(function(){
                //Скрыть PopUp при загрузке страницы
                PopUpHideStatistic();
            });
            //Функция отображения PopUp
            function PopUpShowStatistic(){
                $("#popupStatistic").show();
            }
            //Функция скрытия PopUp
            function PopUpHideStatistic(){
                $("#popupStatistic").hide();
            }
            //-------------------------------------------
            $(document).ready(function(){
                //Скрыть PopUp при загрузке страницы
                PopUpHideEditSubscription();
            });
            //Функция отображения PopUp
            function PopUpShowEditSubscription(){
                $("#popupEditSubscription").show();
            }
            //Функция скрытия PopUp
            function PopUpHideEditSubscription(){
                $("#popupEditSubscription").hide();
            }
            /*--------------------------------------*/
            $(document).ready(function(){
                //Скрыть PopUp при загрузке страницы
                PopUpHideNewSubscription();
            });
            //Функция отображения PopUp
            function PopUpShowNewSubscription(){
                $("#popupNewSubscription").show();
            }
            //Функция скрытия PopUp
            function PopUpHideNewSubscription(){
                $("#popupNewSubscription").hide();
            }
            //----------------------------------------------
            $(document).ready(function(){
                //Скрыть PopUp при загрузке страницы
                PopUpHideAddNewClient();
            });
            //Функция отображения PopUp
            function PopUpShowAddNewClient(){
                $("#popupAddNewClient").show();
            }
            //Функция скрытия PopUp
            function PopUpHideAddNewClient(){
                $("#popupAddNewClient").hide();
            }
            //------------------------------------------------
        </script>
    </head>

    <body>
        <form class="form-wrapper">
            <input name="surnameOrCardNumber" placeholder="Введите фамилию или номер карты" class="form-control"required="" type="text" id="search" onkeyup="tableSearch()">
        </form>

        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        <c:if test="${not empty message}">
            <div class="message">${message}</div>
        </c:if>

        <div>
            <a href="javascript:PopUpShowAddNewClient()">
                <input value="Добавить нового клиента" class="addNewClient" id="addNewClient" type="submit">
            </a>
        </div>

        <jsp:include page="newClient.jsp"/>

        <jsp:include page="clientTable.jsp"/>

        <div class="footer-container">
            <jsp:include page="birthdayTable.jsp"/>

            <div class="b-container-Statistic">
                <a href="javascript:PopUpShowStatistic()">
                    <input type="submit" name="command" value="Statistic" class="btnFooter"/>
                </a>
            </div>
            <div class="b-popup" id="popupStatistic">
                <div class="b-popup-content">
                    Text in Popup statistic
                    <a href="javascript:PopUpHideStatistic()">Back</a>
                </div>
            </div>

            <div class="b-container-newSubscription">
                <a href="javascript:PopUpShowNewSubscription()">
                    <button class="btnFooter" id="newSubscription">Новый абонемент</button>
                </a>
            </div>
            <div class="b-popup" id="popupNewSubscription">
                <div class="b-popup-content">
                    Text in Popup new sub
                    <a href="javascript:PopUpHideNewSubscription()">Back</a>
                </div>
            </div>

            <div>
                <a href="javascript:PopUpShowEditSubscription()">
                    <button class="btnFooter" id="editSubscription">Редактировать абонемент</button>
                </a>
            </div>
            <div class="b-popup" id="popupEditSubscription">
                <div class="b-popup-content">
                    Text in Popup edit sub
                    <a href="javascript:PopUpHideEditSubscription()">Back</a>
                </div>
            </div>
        </div>
    </body>
</html>
