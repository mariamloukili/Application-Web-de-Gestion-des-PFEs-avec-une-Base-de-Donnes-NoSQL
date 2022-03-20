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
	import="com.mongodb.client.FindIterable" import="java.util.ArrayList"
	import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

  <title>Master Business Intelligence & Big Data Analytics</title>

<!-- Custom fonts for this theme -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Theme CSS -->
<link href="css/freelancer.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
				<a class="navbar-brand" href="#">
          			<img src="logo.png" width="60" alt="" class="img-fluid z-depth-4 rounded"> Master Bibda
        		</a>
			<button
				class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="index.jsp">Accueil</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="insertion.jsp">Ajouter un PFE</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<!-- Masthead -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
		<h2 align="center">Liste des projets de fin d'études</h2>
	<br>

<%
			//MongoClient mongoClient = MongoClients.create("mongodb://localhost:27018,localhost:27019,localhost:27020/?replicaSet=replicat");
			MongoClient mongoClient = new MongoClient("localhost",27000);
			MongoDatabase db = mongoClient.getDatabase("PFEdb"); 
			MongoCollection<Document> col = db.getCollection("PFE"); 
			FindIterable<Document> docs = col.find();

			for (Document doc : docs) {

				Object pid = doc.get("_id");
				String ptitre = (String) doc.get("titre");
				Document pauteur = (Document) doc.get("auteur");

				String etudiant1 = (String) pauteur.get("Nom et Prenom de l'etudiant 1");
				String etudiant2 = (String) pauteur.get("Nom et Prenom de l'etudiant 2");
				String etudiant3 = (String) pauteur.get("Nom et Prenom de l'etudiant 3");
				String email1 = (String) pauteur.get("email de l'etudiant 1");
				String email2 = (String) pauteur.get("email de l'etudiant 2");
				String email3 = (String) pauteur.get("email de l'etudiant 3");

				String nomPFE = (String) doc.get("nomPFE");
				String pdate = (String) doc.get("dateS");
				String pencadrant = (String) doc.get("nomEnc");
				String pdept = (String) doc.get("Dept");
				String puniv = (String) doc.get("universite");
		%>
<CENTER><TABLE width=70% border=4 class="table-bordered text-center" >
<TR>
<TD colspan=3 align=center  bgcolor="#1d969a"><strong>Titre du PFE : </strong><% out.print(ptitre);%></TD>
</TR>
<TR>
<TD width=30%  bgcolor=" #e5efef "><strong>Nom du PFE</strong></TD><TD width=70%><% out.print(nomPFE);%> </TD>
</TR>
<TR>
<TD width=30% bgcolor=" #e5efef "><strong>Date de la soutenance</strong></TD><TD width=70%><% out.print(pdate);%> </TD>
</TR>
<TR>
<TR>
<TD width=30% bgcolor=" #e5efef "><strong>Nom de l'encadrant</strong></TD><TD width=70%><% out.print(pencadrant);%> </TD>
</TR>
<TR>
<TD width=30% bgcolor=" #e5efef "><strong>Département</strong></TD><TD width=70%><% out.print(pdept);%></TD>
</TR>
<TR>
<TD width=30% bgcolor=" #e5efef "><strong>Université</strong></TD><TD width=70%><% out.print(puniv);%></TD>
</TR>
<TR>
<TD width=30% bgcolor=" #e5efef "><strong>Nom de l'étudiant 1</strong></TD><TD width=70%><% out.print(etudiant1);%> </TD>
</TR>
	<% if(email1 != null & email1.isEmpty()==false){ %>
		<TR>
		<TD width=30% bgcolor=" #e5efef "><strong>Email de l'étudiant 1</strong></TD><TD width=70%><% out.print(email1);%></TD>
		</TR>
	<%} %>
	<% if(etudiant2 !=null & etudiant2.isEmpty()==false){ %>
		<TR>
		<TD width=30% bgcolor=" #e5efef "><strong>Nom de l'étudiant 2</strong></TD><TD width=70%><% out.print(etudiant2);%></TD>
		</TR>
	<% } %>
	<% if(email2 !=null & email2.isEmpty()==false){ %>
		<TR>
		<TD width=30% bgcolor=" #e5efef "><strong>Email de l'étudiant 2</strong></TD><TD width=70%><% out.print(email2);%></TD>
		</TR>
	<% } %>
	<% if(etudiant3 !=null & etudiant3.isEmpty()==false){ %>
		<TR>
		<TD width=30% bgcolor=" #e5efef "><strong>Nom de l'étudiant 3</strong></TD><TD width=70%><% out.print(etudiant3);%></TD>
		</TR>
	<% } %>
	<% if(email3 !=null & email3.isEmpty()==false){ %>
		<TR>
		<TD width=30% bgcolor=" #e5efef "><strong>Email de l'étudiant 3</strong></TD><TD width=70%><% out.print(email3);%></TD>
		</TR>
	<% } %>
<TR>
<TD width=30% ></TD><TD width=70% align=right><a href="modification.jsp?id=<%=pid%>" class="btn btn-primary btn-sm"> Modifier</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="suppression.jsp?id=<%=pid%>" class="btn btn-danger btn-sm">Supprimer</a></TD>
</TR>
</TABLE></CENTER> 
<br><br><br>

					<%
							}
						%>


	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- Copyright Section -->
	<section class="copyright py-4 text-center text-white">
		<div class="container">
      <small>Copyright &copy; 2020 &nbsp;&nbsp; | &nbsp;&nbsp;Faculté des Sciences d'El Jadida: Université Chouaïb Doukkali &nbsp;| &nbsp;Contactez-nous : masterbibda@gmail.com </small>
				 </small>
		</div>
	</section>
	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-to-top d-lg-none position-fixed ">
		<a class="js-scroll-trigger d-block text-center text-white rounded"
			href="#page-top"> <i class="fa fa-chevron-up"></i>
		</a>
	</div>


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/freelancer.min.js"></script>

</body>

</html>
