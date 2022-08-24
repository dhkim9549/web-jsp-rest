<%@ page language="java" contentType="application/json; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.util.Scanner"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLEncoder"%>
<%

    String tkn = request.getParameter("tkn");
    String resvDy = request.getParameter("resvDy");

    String strUrl = "http://localhost:8081/user/add";
    strUrl += "?tkn=" + URLEncoder.encode(tkn, "UTF-8");
    strUrl += "&resvDy=" + resvDy;

    try {
        String strOut = new Scanner(new URL(strUrl).openStream(), "UTF-8").useDelimiter("\\A").next();
        out.write(strOut);
    } catch (Exception e) {
        out.write("" + e);
    }
    
%>
