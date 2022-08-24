<%@ page language="java" contentType="application/json; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Scanner"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.DataOutputStream"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="com.google.gson.Gson"%>

<%!
	// HTTP POST request
	private String sendPost(String targetUrl, String parameters) throws Exception {

		URL url = new URL(targetUrl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("POST"); // HTTP POST 메소드 설정
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		con.setDoOutput(true); // POST 파라미터 전달을 위한 설정

		// Send post request
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
    wr.writeBytes(parameters);
		wr.flush();
		wr.close();
    
    String strOut = "";
    strOut += "con.getContent() = " + con.getContent();
    strOut += "\n";
    strOut += "con.getRequestMethod() = " + con.getRequestMethod();
    strOut += "\n";
    strOut += "con.getResponseCode() = " + con.getResponseCode();
    strOut += "\n";
    strOut += "con.getResponseMessage() = " + con.getResponseMessage();
    strOut += "\n";
    strOut += new Scanner(con.getInputStream(), "UTF-8").useDelimiter("\\A").next();
    
    return strOut;
    
	}
%>

<%
		String urlParameters = "name=%EA%B9%80%EC%B2%9C%EC%9E%AC&mbno=11111111111";
		String responseStr = sendPost("http://101.101.211.19:8080/safe-resv.jsp", urlParameters);
    out.write(responseStr);
%>
