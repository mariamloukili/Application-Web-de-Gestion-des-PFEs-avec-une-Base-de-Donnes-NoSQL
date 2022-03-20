<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="javax.servlet.ServletException"
	import="javax.servlet.annotation.WebServlet"
	import="javax.servlet.http.HttpServlet"
	import="javax.servlet.http.HttpServletRequest"
	import="javax.servlet.http.HttpServletResponse"
	import="com.mongodb.client.MongoDatabase" import="org.bson.Document"
	import ="com.mongodb.BasicDBObject"
	import ="com.mongodb.MongoClient"
	import="com.mongodb.client.MongoCollection"
	import="com.mongodb.client.MongoCursor" import="java.io.PrintWriter"
	import="com.mongodb.client.FindIterable"
	import="org.bson.types.ObjectId"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String pid = request.getParameter("id");
		MongoClient mongoClient = new MongoClient("localhost",27000);
		MongoDatabase db = mongoClient.getDatabase("PFEdb"); 
		MongoCollection<Document> col = db.getCollection("PFE"); 
		BasicDBObject doc = new BasicDBObject();
		doc.put("_id", new ObjectId(pid));

		col.deleteOne(doc);
		response.sendRedirect("consultation.jsp");
	%>
</body>
</html>