<%@ page language="java" contentType="application/json; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.util.Scanner"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="com.google.gson.Gson"%>
<%

    String strOut = new Scanner(request.getInputStream(), "UTF-8").useDelimiter("\\A").next();
    Gson gson = new Gson();
    HashMap map = gson.fromJson(strOut, HashMap.class);
    out.write(gson.toJson(map));
    
%>
