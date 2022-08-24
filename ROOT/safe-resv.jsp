<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Scanner"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="com.google.gson.Gson"%>
<%

    String time = "" + (new Date()).getTime();
    String mbno = request.getParameter("mbno");
    String name = request.getParameter("name");
    HashMap map = new HashMap();
    map.put("time", time);
    map.put("mbno", mbno);
    map.put("name", name);
    Gson gson = new Gson();
    String json = gson.toJson(map);
    String tkn = "";

    String strUrl = "http://localhost:8081/jas/enc";
    strUrl += "?str=" + URLEncoder.encode(json, "UTF-8");

    try {
        String strOut = new Scanner(new URL(strUrl).openStream(), "UTF-8").useDelimiter("\\A").next();
        tkn = strOut;
    } catch (Exception e) {
        out.write("" + e);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>안심전환대출 신청예약</title>
<style>
html {
  font-size: 16px;
}
body {
  background-color: white;
  font-family: '나눔고딕',NanumGothic,'돋움',Dotum,Helvetica,sans-serif;
}

.btn_login_wrap {margin-left:0px;margin-right:38px;margin-top:38px;margin-bottom:38px;}
.btn_login {
  display:block;width:150px;padding:13px 0 13px;
  border:solid 1px rgba(0,0,0,.15);background-color:#31d8d0;box-sizing:border-box;padding:13px 0;border-radius:5.4px
}
.btn_text {
  font-size:20px;font-weight:700;line-height:24px;color:#000;letter-spacing:-.5px
}

.btn_cnl {
  border:solid 0px rgba(0,0,0,.15);background-color:#036635;box-sizing:border-box;padding:4px 15px;
}

.btn_req_wrap {
  display:flex;
  justify-content:end;
  margin:0;
}
.btn_req {
  border:solid 0px rgba(0,0,0,.15);background-color:#036635;box-sizing:border-box;padding:4px 9px;border-radius:20px
}
.btn_req_text {
  font-size:14px;font-weight:700;line-height:14px;color:#fff;letter-spacing:-.5px
}

.jfk_textinput{border-radius:1px;border:1px solid #d9d9d9;border-top:1px solid #c0c0c0;font-size:13px;height:25px;padding:1px 8px}
.jfk_textinput:focus{box-shadow:inset 0 1px 2px rgba(0,0,0,.3);border:1px solid #4d90fe;outline:none}
.label_req{font-size:13px;line-height:25px;}

.flex_input {
  display: flex;
  justify-content: left;
  flex-flow: column;
  background-color: #ffffff;
  margin: 0;
  padding-top: 2em;
  padding-left: 2em;
  padding-right: 2em;
}
@media only screen and (min-width: 992px) {
  .flex_input {
    padding-left: 3em;
  }
}

.preference {
  display: flex;
  flex-flow: column;
  width: 100%;
  margin-bottom: 0.7em;
}
@media only screen and (min-width: 992px) {
  .preference {
    width: 20em;
  }
}

.flex-header {
  display: flex;
  justify-content: left;
  flex-flow: column;
  background-color: #eeeeee;
  margin: 0px;
  padding-top: 3em;
  padding-bottom: 2em;
  padding-left: 2em;
}
@media only screen and (min-width: 992px) {
  .flex-header {
    padding-left: 68px;
  }
}
.flex-header > div {
  margin-bottom: 0.7em;
  font-size: 1.8em;
  font-weight: bold;
}

.flex-container-2 {
  display: flex;
  justify-content: left;
  flex-flow: column;
  background-color: #eeeeee;
  margin: 0px;
  padding: 1em;
}
.flex-container-2 > div {
  display: flex;
  justify-content: space-between;
  padding: 1em;
  font-size: 1em;
  border: solid 1px black;
}
@media only screen and (min-width: 992px) {
  .flex-container-2 > div {
    width: 30em;
  }
}

.flex-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: left;
  background-color: #eeeeee;
  margin: 0px;
  padding: 5px;
}
.flex-container > div {
  flex: 0 1 100%;
  display: flex;
  flex-direction: column;
  background-color: #ffffff;
  margin: 0.5em;
  padding: 1em;
  text-align: left;
  font-size: 1em;
  transition: box-shadow .2s ease;
}
@media only screen and (min-width: 992px) {
  .flex-container > div {
    flex: 0 1 12em;
  }
}
.flex-container > div:hover {
  box-shadow: 0 0 11px rgba(33,33,33,.2); 
}
.flex-container > div > p {
  font-size: 1.4em;
}
.flex-container > div > div {
  font-size: 0.9em;
  margin-top: 0.4em;
  margin-bottom: 0.4em;
}
.cont {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  max-width: 100%;
  line-height: 1.4em
}


</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/df-number-format/2.1.6/jquery.number.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

var dd;
var ddd;

function getUser() {

  document.getElementById("body1").style = "background-color: #0abab5;";
  var userResvDy = document.getElementById("userResvDy");
  userResvDy.innerHTML = "";

  fetch("/user-get.jsp?tkn=" + encodeURIComponent(objData.tkn))
    .then(r => r.json())
    .then(d => {
      ddd = d;
      if(d.resvDy == undefined) {
        return;
      } else if(d.resvDy === "") {
        var e1 = document.createElement('div');
		e1.innerHTML = "예약일자가 없습니다.";
        userResvDy.append(e1);
      } else {
        var e1 = document.createElement('div');
		e1.innerHTML = "예약일자: " + d.resvDy;
        userResvDy.append(e1);

        var e2 = document.createElement('button');
        e2.classList.add("btn_cnl");
        userResvDy.append(e2);
        
        e2.addEventListener("click", function() {
          delUser();
        });
        
        var e20 = document.createElement('span');
        e20.classList.add("btn_req_text");
        e20.innerHTML = "예약취소하기";
        e2.append(e20);

      }
    });
  document.getElementById("body1").style = "background-color: white;";
}

function resvAll() {

  var board1 = document.getElementById("board1");
  board1.innerHTML = "";
  document.getElementById("body1").style = "background-color: #0abab5;";

  fetch("/resv-all.jsp")
    .then(r => r.json())
    .then(d => {

        dd = d;
        var items = d;
        items.sort((a, b) => a.resvDy - b.resvDy);
        
        var iRcmdRnk = 0;
        items.forEach(element => {
        
            var e = document.createElement('div');
            e.className = "warning";
            board1.append(e);
            
            var e1 = document.createElement('p');
            e1.innerHTML = element.resvDy;
            e.append(e1);
			
            var e21 = document.createElement('div');
            e21.innerHTML = "예약건수: " + $.number(element.resvCnt);
            e.append(e21);
        
            var e22 = document.createElement('div');
            e22.innerHTML = "전체건수: " + $.number(element.allCnt);
            e.append(e22);
            
            var e23 = document.createElement('div');
            if(element.resvCnt < element.allCnt) {
              e23.innerHTML = "예약가능";
              e23.style = "color:blue;";
            } else {
              e23.innerHTML = "예약마감";
              e23.style = "color:red;";
            }
            e.append(e23);
              
            var e24 = document.createElement('div');
            e24.classList.add("btn_req_wrap");
            e.append(e24);

            var e240 = document.createElement('button');
            e240.classList.add("btn_req");
            e24.append(e240);
            
            if(element.resvCnt < element.allCnt) {
              e240.addEventListener("click", function() {
                addUser(element.resvDy);
              });
            } else {
              e240.disabled = true;
              e240.style = "background-color:#ddd";
            }
            
            var e2400 = document.createElement('span');
            e2400.classList.add("btn_req_text");
            e2400.innerHTML = "예약하기";
            e240.append(e2400);

        });
        document.getElementById("body1").style = "background-color: white;";
    });
}

var rrr;

function delUser() {
  fetch("/user-del.jsp?tkn=" + encodeURIComponent(objData.tkn))
    .then(r => r.json())
    .then(d => {
      if(d.rslt == "deleted") {
        alert("정상적으로 예약취소되었습니다.");
        getUser();
        resvAll();
      } else if(d.rslt == "invalid-tkn") {
        alert("로그인 페이지로 이동합니다.");
        open("/login.html", "_self");
      }
    });
}

function addUser(resvDy) {
  fetch("/user-add.jsp?tkn=" + encodeURIComponent(objData.tkn) + "&resvDy=" + resvDy)
    .then(r => r.json())
    .then(d => {
      if(d.rslt == "pre-reserved") {
        alert("예약된 건이 있습니다. 기존 건을 예약취소 후 예약하세요.");
        getUser();
      } else if(d.rslt == "saved") {
        alert("정상적으로 예약신청되었습니다.");
        getUser();
        resvAll();
      } else if(d.rslt == "invalid-tkn") {
        alert("로그인 페이지로 이동합니다.");
        open("/login.html", "_self");
      }
    });
}

var objData;

document.addEventListener("DOMContentLoaded", function(event) {
  
  var a = document.getElementById("data-f");
  var b = a.getAttribute("data-foobar");
  objData = JSON.parse(b);
  
  getUser();
  resvAll();
  
});

</script>
</head>
<body id="body1">

<div id="board0" class="flex-header">
    <div>안심전환대출 신청예약</div>
</div>

<div id="board2" class="flex-container-2">
    <div id="userResvDy"></div>
</div>

<div id="board1" class="flex-container">
</div>

<div id="div1" class="flex-header">
이 웹페이지는 프로토타입입니다.
</div>

<div id="data-f" data-foobar='{"tkn":"<%= tkn %>"}'></div>

</body>
</html>