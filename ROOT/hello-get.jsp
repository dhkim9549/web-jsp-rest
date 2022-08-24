<%@ page language="java" contentType="application/json; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.util.Scanner"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLEncoder"%>
<%

    String loanYm = request.getParameter("loanYm");
    
    Map<String, String[]> parameters = request.getParameterMap();
    for(String parameter : parameters.keySet()) {
            String[] values = parameters.get(parameter);
            out.println();
            out.print(parameter+" = ");
            out.println(String.join(",",values));
    }
    
%>
