
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;


/**
 * Servlet implementation class modifer
 */
@WebServlet("/modifier")
public class modifier extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public modifier() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MongoClient mongoClient = new MongoClient("localhost",27000);
		MongoDatabase db = mongoClient.getDatabase("PFEdb"); 
		MongoCollection<Document> col = db.getCollection("PFE"); 
		BasicDBObject newDoc = new BasicDBObject();
			
		newDoc.append("$set", new BasicDBObject().append("auteur.Nom et Prenom de l'etudiant 1", request.getParameter("auteur1"))
				.append("auteur.Nom et Prenom de l'etudiant 2", request.getParameter("auteur2")).
				append("auteur.Nom et Prenom de l'etudiant 3", request.getParameter("auteur3"))
				.append("auteur.email de l'etudiant 1", request.getParameter("email1"))
				.append("auteur.email de l'etudiant 2", request.getParameter("email2"))
				.append("auteur.email de l'etudiant 3", request.getParameter("email3"))
				.append("titre", request.getParameter("titre")).append("nomPFE", request.getParameter("nom"))
				.append("dateS", request.getParameter("date")).append("nomEnc", request.getParameter("encadrant"))
				.append("Dept", request.getParameter("departement")).append("universite", request.getParameter("universite")));
		
		String pid = request.getParameter("id");
		System.out.print(pid);
		col.updateOne(new BasicDBObject("_id", new ObjectId(pid)), newDoc);
		response.sendRedirect("consultation.jsp");

	}

}
