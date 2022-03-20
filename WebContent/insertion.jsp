<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Set"

	import="javax.servlet.ServletException"
	import="javax.servlet.annotation.WebServlet"
	import="javax.servlet.http.HttpServlet"
	import="javax.servlet.http.HttpServletRequest"
	import ="javax.servlet.http.HttpServletResponse"
	import = "com.mongodb.client.MongoDatabase"
	import ="org.bson.Document"
	import ="com.mongodb.BasicDBObject"
	import ="com.mongodb.MongoClient"
	import ="com.mongodb.client.MongoCollection"
	
    %>
   
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Master Business Intelligence & Big Data Analytics</title>

  <!-- Custom fonts for this theme -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Theme CSS -->
  <link href="css/freelancer.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
		<a class="navbar-brand" href="#">
          <img src="logo.png" width="60" alt="" class="img-fluid z-depth-4 rounded"> Master Bibda
        </a>      <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="index.jsp">Accueil</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="consultation.jsp">Consultation</a>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>

  <!-- Masthead -->
  

 <br><br><br><br><br><br>
 	<h2 align="center">Ajouter un projet de fin d'études</h2>
 <br>    
 <div class="container">
<form method="get" action="insertion.jsp">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Titre du PFE</label>
      <input type="text" name="titre" class="form-control" id="inputEmail4" placeholder="Titre du PFE" required="required">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Nom du PFE</label>
      <input type="text"  name="nom" class="form-control" id="inputPassword4" placeholder="Nom du PFE" required="required">
    </div>
  </div>
  
   <div class="form-group">
    <label for="inputAddress">date du soutenance</label>
    <input type="text"  name="date" class="form-control" id="inputAddress" placeholder="20/06/2020" required="required">
  </div>
  <div class="form-group">
    <label for="inputAddress2">Nom de l'encadrant</label>
    <input type="text"  name="encadrant" class="form-control" id="inputAddress2" placeholder="Encadrant" required="required">
  </div>
  
  <div class="form-row">
   <div class="form-group col-md-6">
      <label for="inputEmail4">Nom et Prenom de l'étudiant 1</label>
      <input type="text"  name="auteur1" class="form-control" id="inputEmail4" placeholder="Nom et Prenom" required="required">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email de l'étudiant 1</label>
      <input type="email"  name="email1" class="form-control" id="inputPassword4" placeholder="jack.LK@gmail.com">
    </div>
  </div>
  
  <div class="form-row">
   <div class="form-group col-md-6">
      <label for="inputEmail4">Nom et Prenom de l'étudiant 2</label>
      <input type="text"  name="auteur2" class="form-control" id="inputEmail4" placeholder="Nom et Prenom">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email de l'étudiant 2</label>
      <input type="email"  name="email2" class="form-control" id="inputPassword4" placeholder="jack.LK@gmail.com">
    </div>
  </div>
  
  <div class="form-row">
   <div class="form-group col-md-6">
      <label for="inputEmail4">Nom et Prenom de l'étudiant 3</label>
      <input type="text"  name="auteur3" class="form-control" id="inputEmail4" placeholder="Nom et Prenom">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email de l'étudiant 3</label>
      <input type="email"  name="email3" class="form-control" id="inputPassword4" placeholder="jack.LK@gmail.com">
    </div>
  </div>
 
<br>  
  <input type="submit" class="btn btn-primary" value="Enregistrer"> 
  <input type="reset" class="btn btn-primary" value="Annuler"> 

</form>
 </div>
<%
	    
		MongoClient mongoClient = new MongoClient("localhost",27000);
		MongoDatabase db = mongoClient.getDatabase("PFEdb"); 
		MongoCollection<Document> col = db.getCollection("PFE"); 
		Document doc = new Document();
		doc.put("titre", request.getParameter("titre"));
		doc.put("nomPFE", request.getParameter("nom"));
		doc.put("dateS", request.getParameter("date"));
		doc.put("nomEnc", request.getParameter("encadrant"));
		doc.put("Dept", "Informatique");
		String universite = "Faculté des Sciences, Université Chouaïb Doukkali, El Jadida";
		doc.put("universite", universite);
		
		BasicDBObject authorDetails = new BasicDBObject();
		authorDetails.put("Nom et Prenom de l'etudiant 1", request.getParameter("auteur1"));
		authorDetails.put("Nom et Prenom de l'etudiant 2", request.getParameter("auteur2"));
		authorDetails.put("Nom et Prenom de l'etudiant 3", request.getParameter("auteur3"));
		authorDetails.put("email de l'etudiant 1", request.getParameter("email1"));
		authorDetails.put("email de l'etudiant 2", request.getParameter("email2"));
		authorDetails.put("email de l'etudiant 3", request.getParameter("email3"));
		doc.put("auteur", authorDetails);

		if(request.getParameter("titre")!=null){
			col.insertOne(doc);
			response.sendRedirect("consultation.jsp");
		}
	%>
<br><br><br><br><br>  

  <!-- Copyright Section -->
  <section class="copyright py-4 text-center text-white">
    <div class="container">
      <small>Copyright &copy; 2020 &nbsp;&nbsp; | &nbsp;&nbsp;Faculté des Sciences d'El Jadida: Université Chouaïb Doukkali &nbsp;| &nbsp;Contactez-nous : masterbibda@gmail.com </small>
    </div>
  </section>

  <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
  <div class="scroll-to-top d-lg-none position-fixed ">
    <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
      <i class="fa fa-chevron-up"></i>
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
