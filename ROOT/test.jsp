<%@ page language="java" contentType="application/json; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.util.Scanner"%>
<%@ page import="java.net.URL"%>
<%

    String strUrl = "http://apis.data.go.kr/B551408/rent-loan-rate-multi-dimensional-info/dimensional-list?serviceKey=PW2VvwTvkcs%2FWMVLduXzeRL0BPjOYH%2B0wMnsQiyy5UgcrukEjAurATJUNkeA7T%2Bj47s3GAmLzHduip%2BfbxESlQ%3D%3D&pageNo=1&numOfRows=30&dataType=JSON&loanYm=L1M";

    try {
        String strOut = new Scanner(new URL(strUrl).openStream(), "UTF-8").useDelimiter("\\A").next();
        out.write(strOut);
    } catch (Exception e) {
        out.write("" + e);
    }
    
%>
