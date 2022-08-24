<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>print PDF test</title>
<style>
html {
  font-size: 16px;
}
body {
  background-color: #fbfbfd;
  font-family: '나눔고딕',NanumGothic,'돋움',Dotum,Helvetica,sans-serif;
}
.btn_login_wrap {margin:0;}
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

<!--
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/print-js/1.6.0/print.min.css">
-->
.printModal{font-family:sans-serif;display:flex;text-align:center;font-weight:300;font-size:30px;left:0;top:0;position:absolute;color:#045fb4;width:100%;height:100%;background-color:rgba(255,255,255,.9)}.printClose{position:absolute;right:10px;top:10px}.printClose:before{content:"\00D7";font-family:"Helvetica Neue",sans-serif;font-weight:100;line-height:1px;padding-top:.5em;display:block;font-size:2em;text-indent:1px;overflow:hidden;height:1.25em;width:1.25em;text-align:center;cursor:pointer}.printSpinner{margin-top:3px;margin-left:-40px;position:absolute;display:inline-block;width:25px;height:25px;border:2px solid #045fb4;border-radius:50%;animation:spin .75s infinite linear}.printSpinner::after,.printSpinner::before{left:-2px;top:-2px;display:none;position:absolute;content:'';width:inherit;height:inherit;border:inherit;border-radius:inherit}.printSpinner,.printSpinner::after,.printSpinner::before{display:inline-block;border-color:transparent;border-top-color:#045fb4;animation-duration:1.2s}.printSpinner::before{transform:rotate(120deg)}.printSpinner::after{transform:rotate(240deg)}@keyframes spin{from{transform:rotate(0)}to{transform:rotate(360deg)}}
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!--
<script src="https://cdnjs.cloudflare.com/ajax/libs/print-js/1.6.0/print.min.js"></script>
-->
<script src="./print.min.js"></script>

<!--
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf-lib/1.17.1/pdf-lib.min.js"></script>
-->
<script src="./pdf-lib.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<script>

async function imageToPdf(imgUrl) {
  instance = async PSPDFKit.load({
    document: imgUrl
  });
  const documentArrayBuffer = await instance.exportPDF();
  return documentArrayBuffer;
}

async function printPDFS(imgArr) {

  var bTxt = document.getElementById("button1Txt");
  bTxt.innerHTML = '출력중';

  const mergedPdf = await PDFLib.PDFDocument.create();
  for (const imgUrl of imgArr) {
    const pdfBytes = await imageToPdf(imgUrl);
    //const pdfBytes = fs.readFileSync(pdfCopyDoc);
    const pdf = await PDFLib.PDFDocument.load(pdfBytes);
    const copiedPages = await mergedPdf.copyPages(pdf, pdf.getPageIndices());
      copiedPages.forEach((page) => {
      mergedPdf.addPage(page);
    });
  }
  const mergedPdfFile = await mergedPdf.save();
  const pdfDataUri = await mergedPdf.saveAsBase64({ dataUri: true });
  this.downloadFile(mergedPdfFile);
  
  // printJS({printable: pdfDataUri, type: 'pdf', base64: true});
  // printJS('BTC-QF-appendix.pdf');
}

function downloadFile(data) {
  const blob = new Blob([data], { type: 'application/pdf' });
  const url = window.URL.createObjectURL(blob);
  //window.open(url);
  printJS({
    printable: url,
    type: 'pdf',
    onPrintDialogClose: () => {
      var bTxt = document.getElementById("button1Txt");
      bTxt.innerHTML = '출력';
    }
  })
}


var imgArr = [
    'https://image.istarbucks.co.kr/upload/store/skuimg/2022/04/[9200000004119]_20220412083025862.png',
    'https://image.istarbucks.co.kr/upload/store/skuimg/2022/04/[9200000004124]_20220421141735718.jpg'
];

/* Array of pdf urls */
var pdfsToMerge = ['BTC-QF-appendix.pdf', 'BTC-QF-appendix.pdf', 'BTC-QF-appendix.pdf', 'BTC-QF-appendix.pdf', 'BTC-QF-appendix.pdf', 'BTC-QF-appendix.pdf']
// var pdfsToMerge = JSON.parse(' <%= request.getParameter("p") %> ');
// var pdfsToMerge = <%= request.getParameter("p") %>;



document.addEventListener("DOMContentLoaded", function(event) {
  document.getElementById("button1").addEventListener("click", function() {
    // printJS('BTC-QF-appendix.pdf');
    
    printPDFS(imgArr);
  });
  
  getList();
  printPDFS(imgArr);
});

function getList() {

  var board1 = document.getElementById("board1");  
  var iRcmdRnk = 0;
  
  pdfsToMerge.forEach(element => {
  
      var e = document.createElement('div');
      e.className = "warning";
      board1.append(e);
      
      var e1 = document.createElement('p');
      e1.innerHTML = "번호: " + (++iRcmdRnk);
      e.append(e1);
	
      var e21 = document.createElement('div');
      e21.innerHTML = "파일명: " + element;
      e.append(e21);
      
  });
  document.getElementById("board1").style = "background-color: #fbfbfd;";
  // document.getElementById("rcmdCmt").scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
}


</script>
</head>
<body id="body1">

<div id="board0" class="flex-header">
    <div>print PDF test</div>
</div>

<div class="flex_input" id="input_area">
  <div class="preference">
    <label for="name" class="label_req">loanYm</label>
    <input type="text" id="loanYm" name="loanYm" minlength="4" maxlength="8" size="20" class="jfk_textinput">
  </div>
</div>

<div class="flex_input_2">
  <div>
  print PDF test
  </div>
  <div class="btn_login_wrap">
    <button class="btn_login" id="button1">
      <span class="btn_text" id="button1Txt">출력</span>
    </button>
  </div>
</div>

<div id="board1" class="flex-container">
</div>

<div id="div1" class="flex-header">
이 웹페이지는 프로토타입입니다.
</div>

</body></html>