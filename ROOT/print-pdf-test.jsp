<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>print PDF popup test</title>
<style>
html {
  font-size: 16px;
}
body {
  background-color: #fbfbfd;
  font-family: '나눔고딕',NanumGothic,'돋움',Dotum,Helvetica,sans-serif;
}
.btn_login_wrap {margin-left:1em;}
.btn_login {
  display:block;width:150px;padding:13px 0 13px;
  border:solid 1px rgba(0,0,0,.15);background-color:#036635;box-sizing:border-box;padding:13px 0;border-radius:5.4px
}
.btn_text {
  font-size:20px;font-weight:700;line-height:24px;color:#fbfbfd;letter-spacing:-.5px
}

.jfk_textinput{border-radius:1px;border:1px solid #d9d9d9;border-top:1px solid #c0c0c0;font-size:13px;height:25px;padding:1px 8px}
.jfk_textinput:focus{box-shadow:inset 0 1px 2px rgba(0,0,0,.3);border:1px solid #4d90fe;outline:none}
.label_req{font-size:13px;line-height:25px;}


.flex-header {
  display: flex;
  justify-content: left;
  flex-flow: column;
  background-color: #fbfbfd;
  margin: 0px;
  padding-top: 3em;
  padding-bottom: 2em;
  padding-left: 68px;
}
.flex-header > div {
  margin-bottom: 0.7em;
  font-size: 1.5em;
  font-weight: bold;
}

.flex_input {
  display: flex;
  flex-wrap: wrap;
  justify-content: start;
  background-color: white;
  margin: 0 0.5em;
  padding: 2em 0;

  border-radius: 8px;
  box-shadow: 2px 2px 20px 0 rgba(0,0,0,0.04);
}

.flex_input > div {
  margin: 0 3em 1em;
}

.flex_input_2 {
  display: flex;
  justify-content: space-between;
  margin: 0 0.5em;
  padding: 2em;
}
@media only screen and (min-width: 992px) {
  .flex_input_2 {
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

.flex-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: start;
  background-color: #fbfbfd;
  margin: 0px;
  padding: 5px;
}
.flex-container > div {
  flex: 0 1 100%;
  display: flex;
  flex-direction: column;
  margin: 0.5em;
  padding: 1em;
  text-align: left;
  font-size: 1em;

  background: #fff;
  box-shadow: 2px 2px 20px 0 rgba(0,0,0,0.04);
  overflow: auto;
}
@media only screen and (min-width: 992px) {
  .flex-container > div {
    flex: 0 1 15em;
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
  max-width: 100%;
  line-height: 1.4em
}


.select {
    padding: 0;
}
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 60px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.select input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}

.checks {
    position: relative;
    height: 20px;
    padding: 0;
    line-height: 20px;
}
.checks label {
    font-weight:bold;
    font-size:13px;
    margin-right: 10px;
    vertical-align: middle;
}            
.checks input[type="radio"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    border: 0;
}
.checks input[type="radio"]+label {
    display: inline-block;
    position: relative;
    padding-left: 25px;
    cursor: pointer;
}
            
.checks input[type="radio"]+label:before {
    content: '';
    position: absolute;
    left: 4px;
    top: 0px;
    width: 14px;
    height: 14px;
    text-align: center;
    background: #fff;
    border: 1px solid #cacece;
    border-radius: 100%;
    box-shadow: none;
}
.checks input[type="radio"]:checked+label:before {
    background: #333;
    border-color: #333;
} 


</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/df-number-format/2.1.6/jquery.number.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.0/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip-utils/0.1.0/jszip-utils.min.js"></script>
<script>

function zipTest() {
  
  var zip = new JSZip();
  zip.file("Hello.txt", "Hello World\n");
  zip.generateAsync({type:"blob"})
  .then(function(content) {
      // see FileSaver.js
      saveAs(content, "example.zip");
  });
}

function downloadWithBlob() {
  var zip = new JSZip();
  var urls = ['BTC-QF-appendix.pdf', '2004.05894.pdf', 'BTC-QF-appendix.pdf'];
  urls.forEach(function(url, index){
    var filename = urls[index];
    zip.file(filename, urlToPromise(url), {binary:true});
  });
  zip.generateAsync({type:'blob'}).then(function(content) {
    saveAs(content, "example.zip");
  });
}

function urlToPromise(url) {
    return new Promise(function(resolve, reject) {
        JSZipUtils.getBinaryContent(url, function (err, data) {
            if(err) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

var dd;
var zloanYm;

function getList() {

  var board1 = document.getElementById("board1");
  board1.innerHTML = "";
  document.getElementById("board1").style = "background-color: #31d8d0;";
  
  fetch("http://apis.data.go.kr/B551408/rent-loan-rate-multi-dimensional-info/dimensional-list?serviceKey=PW2VvwTvkcs%2FWMVLduXzeRL0BPjOYH%2B0wMnsQiyy5UgcrukEjAurATJUNkeA7T%2Bj47s3GAmLzHduip%2BfbxESlQ%3D%3D&pageNo=1&numOfRows=30&dataType=JSON"
          + "&loanYm=" + getRadioButtonValue("loanYm")
          + "&aaaYn=" + getRadioButtonValue("aaaYn")
    )
    .then(r => r.json())
    .then(d => {

        dd = d;
        var items = d.body.items;
        items.sort((a, b) => b.loanAmt - a.loanAmt);
        
        var iRcmdRnk = 0;
        items.forEach(element => {
        
            var e = document.createElement('div');
            e.className = "warning";
            board1.append(e);
            
            var e1 = document.createElement('p');
            e1.innerHTML = element.bankNm;
            e.append(e1);
			
            var e20 = document.createElement('div');
            e20.innerHTML = "추천순위: " + (++iRcmdRnk);
            e.append(e20);

            var e21 = document.createElement('div');
            e21.innerHTML = "대출실행금액: " + $.number(element.loanAmt);
            e.append(e21);
        
            var e22 = document.createElement('div');
            e22.innerHTML = "금리: " + $.number(element.avgLoanRat2, 2);
            e.append(e22);
            
            var e23 = document.createElement('div');
              e23.className = "cont";
              if(Math.random() < 0.4) {
                e23.innerHTML = `신청대상 : 다음의 ①~⑤을 모두 충족하는 자
① 대한민국 국민
② 임차보증금 7억원(지방 5억원)이하인 임대차계약을 체결하고 임차보증금의 5% 이상 지급한 세대주
③ 본인과 배우자 합산 주택보유수가 1주택 이내
(단, 1주택인 경우 배우자 합산 연소득이 1억원 이하이고, 보유주택의 가격이 9억원을 초과하지 않아야 함)
④ 2020년 7월10일 이후 본인과 배우자(결혼예정자 포함) 투기지역 · 투기과열지구 소재 3억원 초과 아파트를 취득하지 않아야 함
<br><a href="https://hf.go.kr/hf/sub02/sub01_01_01.do" target="_blank">상품 상세 설명 홈페이지</a>`;
            } else {
              e23.innerHTML = "";
            }
            e.append(e23);
            
        });
        document.getElementById("board1").style = "background-color: #fbfbfd;";
        document.getElementById("rcmdCmt").scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
    });
}

document.addEventListener("DOMContentLoaded", function(event) {
  document.getElementById("button1").addEventListener("click", function() {
    getList();
  });
  document.getElementById("input_area").addEventListener('keydown', (e) => {
    if(e.key == "Enter") {
      document.getElementById("button1").click(); 
    }
  });
  document.getElementById("button2").addEventListener("click", function() {
    window.open(
      "http://bada.ai/print-pdf.jsp?p="
        + encodeURIComponent(JSON.stringify(pdfArr)), 
      "_blank", "popup"
    );
  });
  document.getElementById("button3").addEventListener("click", function() {
    downloadWithBlob();
  });
  $('#incmAmt').number(true, 0);
});

var pdfArr = ['BTC-QF-appendix.pdf', '2004.05894.pdf', 'BTC-QF-appendix.pdf'];

function getRadioButtonValue(varName) {
  const radioButtons = document.querySelectorAll('input[name=' + varName +']');
  let selectedValue;
  for (const radioButton of radioButtons) {
    if (radioButton.checked) {
      selectedValue = radioButton.value;
      break;
    }
  }
  return selectedValue;
}        

</script>
</head>
<body id="body1">

<div id="board0" class="flex-header">
    <div>print PDF popup test</div>
</div>

<div class="flex_input" id="input_area">

  <div class="preference">
    <label for="" class="label_req">weddStcd</label>
    <div class="select">
      <input type="radio" id="weddStcd1" name="weddStcd" value="1" checked><label for="weddStcd1">미혼</label>
      <input type="radio" id="weddStcd2" name="weddStcd" value="2"><label for="weddStcd2">기혼</label>
      <input type="radio" id="weddStcd3" name="weddStcd" value="3"><label for="weddStcd3">신혼</label>
      <input type="radio" id="weddStcd4" name="weddStcd" value="4"><label for="weddStcd4">결혼예정</label>
    </div>
  </div>

  <div class="preference">
    <label for="" class="label_req">loanYm</label>
    <div class="select">
      <input type="radio" id="loanYm1" name="loanYm" value="L1M"><label for="loanYm1">L1M</label>
      <input type="radio" id="loanYm2" name="loanYm" value="L3M"><label for="loanYm2">L3M</label>
      <input type="radio" id="loanYm3" name="loanYm" value="L1Y"><label for="loanYm3">L1Y</label>
    </div>
  </div>

  <div class="preference">
    <label for="" class="label_req">aaaYn</label>
    <div class="checks">
      <input type="radio" id="aaaYn1" name="aaaYn" value="Y">
      <label for="aaaYn1">예</label>
      <input type="radio" id="aaaYn2" name="aaaYn" value="N" checked>
      <label for="aaaYn2">아니오</label>
    </div>  
  </div>
  
  

  <div class="preference">
    <label for="name" class="label_req">incmAmt</label>
    <input type="text" id="incmAmt" name="incmAmt" minlength="4" maxlength="16" size="20" class="jfk_textinput" style="text-align: end;">
  </div>
  <div class="preference">
    <label for="name" class="label_req">loanYm3</label>
    <input type="text" id="loanYm3" name="loanYm3" minlength="4" maxlength="8" size="20" class="jfk_textinput">
  </div>
  <div class="preference">
    <label for="name" class="label_req">loanYm4</label>
    <input type="text" id="loanYm4" name="loanYm4" minlength="4" maxlength="8" size="20" class="jfk_textinput">
  </div>
  <div class="preference">
    <label for="name" class="label_req">loanYm5</label>
    <input type="text" id="loanYm5" name="loanYm5" minlength="4" maxlength="8" size="20" class="jfk_textinput">
  </div>
</div>

<div class="flex_input_2">
  <div id="rcmdCmt" style="flex-grow:1">
  전세자금보증을 추천합니다.
  </div>
  <div class="btn_login_wrap">
    <button class="btn_login" id="button1">
      <span class="btn_text">조회</span>
    </button>
  </div>
  <div class="btn_login_wrap">
    <button class="btn_login" id="button2">
      <span class="btn_text">팝업</span>
    </button>
  </div>
  <div class="btn_login_wrap">
    <button class="btn_login" id="button3">
      <span class="btn_text">zip</span>
    </button>
  </div>
</div>

<div id="board1" class="flex-container">
</div>

<div id="div1" class="flex-header">
이 웹페이지는 프로토타입입니다.
</div>

</body></html>