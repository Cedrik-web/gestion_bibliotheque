<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ClassJava.Methode" %>    
<%@ page import="java.sql.*" %>
<%@ page import="javax.swing.*" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="style.css">
		<title>Bibliotheque</title>
	</head>
	<body>
	
		<header>
			<div class="header">
				<h1>Bienvenue dans la bibliothèque PGI - ERP 2022</h1>
				<p>Livres  -  BD  -  Journaux  -  Revues  -  Magazines  -  Mangas  -  CD  -  Dictionnaires</p>
			</div>
		</header>
		
		<main>
			<div class="comboBoxAccueil">
				<form>
					
					<label for="categ">Choisir la catégorie</label>
					<select id="cat" name="categ">
	<!-- 				boucle for pour init le comboBox -->
						
						<% JComboBox cbx = Methode.comboBox(8);
						int cpt = cbx.getItemCount();
			
						for (int i=1; i<cpt; i++) {%>
							<option value="<%= cbx.getItemAt(i)%>"><%= cbx.getItemAt(i)%></option>
						<%}%>
		
					</select>
					
					<label for="genre">Choisir le genre</label>
					<select id="gen" name="genre">
	<!-- 				boucle for pour init le comboBox -->
	
						<% JComboBox cbx2 = Methode.comboBox(7);
						int cpt1 = cbx.getItemCount();
			
						for (int i=1; i<cpt1; i++) {%>
							<option value="<%= cbx2.getItemAt(i)%>"><%= cbx2.getItemAt(i)%></option>
						<%}%>
					
					</select>
					<input class="btn" name="btnValider" type="submit" value="Valider">
				</form>
			</div>
			
			<div class="tableAccueil">
				<table border=1>
				<% JTable tab = Methode.table();%>
					<thead>
						<tr>
							
<%-- 							<%for (int i=0;i<tab.getColumnCount();i++) { %> --%>
<%-- 			                    <th> <%= tab.getColumnName(i) %> </th> --%>
<%-- 			                    <% } %> --%>
							<th>UPDATE</th>
							<th>DELETE</th>
						</tr>	
					</thead>
					<tbody>
						<tr>	
							<td><a href="index.jsp" id="">Modifier</a></td>
							<td><button name="button" onclick="mafonction()">Supprimer</button></td>
						</tr>
					</tbody>	
				</table>
			</div>
			
			<div class="panierAccueil">
				<div>
					<button>Ajouter</button>
					<button>Supprimer</button>
					<button>Effacer</button>
				</div>
					<p>Articles selectionnés</p>
					<textarea rows="" cols=""></textarea>
					<p>Total Articles selectionnés</p>
					<label></label>
				<div>
				</div>
				<div>
				</div>
			</div>
		</main>
		
		<footer>
			<div>
				<button>Gestion des adherents</button>
				<p>Merci de votre confiance et à bientot !! </p>
			</div>
		</footer>
		
	</body>
</html>