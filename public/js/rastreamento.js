/*
 * rastreamento.js
 * Envia GUID do visitante, URL acessada, Título da janela  e Data/Hora do acesso.
 * A GUID do visitante é armazenada em cookie com prazo de expiração de 1 ano.
 */

(function (window, document) {
    "use strict";

    var pathname = window.location.pathname;


    if(pathname == "/rastreamentos") { return }

    var title = document.title;

    Date.prototype.today = function () {
        return ((this.getDate() < 10)?"0":"") + this.getDate() +"/"+(((this.getMonth()+1) < 10)?"0":"") + (this.getMonth()+1) +"/"+ this.getFullYear();
    }

    Date.prototype.timeNow = function () {
        return ((this.getHours() < 10)?"0":"") + this.getHours() +":"+ ((this.getMinutes() < 10)?"0":"") + this.getMinutes() +":"+ ((this.getSeconds() < 10)?"0":"") + this.getSeconds();
    }

    function getDataHora() {
        var newDate = new Date();
        return newDate.today() + " [" + newDate.timeNow() + "]";
    }

    function generateGUID() {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
            var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
            return v.toString(16);
        });
    }

    function setVisitanteGUID(guid) {
        var date = new Date();
        var oneYearExpiration = 365 * 24 * 60 * 60 * 1000;
        date.setTime(date.getTime() + (oneYearExpiration));
        document.cookie = "visitanteGUID=" + encodeURI(guid) + "; expires=" + date.toGMTString(); "; path=/";
    }

    function getVisitanteGUID() {
        var visitanteGUID = "visitanteGUID=";
        var i, char;

        var splitted = document.cookie.split(';');
        for (i = 0; i < splitted.length; i++) {
            char = splitted[i];
            while (char.charAt(0) === ' ') {
                char = char.substring(1, char.length);
            }
            if (char.indexOf(visitanteGUID) === 0) {
                return decodeURI(char.substring(visitanteGUID.length, char.length));
            }
        }
        return null;
    }

    function done() {
    }

    var guid = getVisitanteGUID();
    if(!guid)
    {
        guid = generateGUID();
        setVisitanteGUID(guid);
    }

    var data_hora = getDataHora();

    var data = {
        rastreamento: {
            visitante: guid,
            url: pathname,
            titulo: title,
            data_hora: data_hora
        }
    };

    $.post(
        "/rastreamentos",
        data,
        done,
        "json");

}(window, document));