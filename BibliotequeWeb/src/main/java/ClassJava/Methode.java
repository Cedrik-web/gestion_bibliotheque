package ClassJava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTable;

import net.proteanit.sql.DbUtils;


public class Methode {
	
	static JFrame jframe = new JFrame();
	
	static String connecting;
	static String query = "select * from Document";
	
	static int cpt=0;
	
	static Connection con = null;
	static Statement stm = null;
	static ResultSet rs = null;
	static ResultSetMetaData rsmd = null;
	
	// Methode de requete SQL -----------------------------------------------------------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------
	public static void Request() {
		
		connecting = "jdbc:sqlserver://LAPTOP-FLK2S20O\\SQLEXPRESS;"
				+ "databaseName= Librairie;"		
				+ "user=sa;password=sa;";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("\nRequete GET demander : " + query + "\n");
		
		try {
			con = DriverManager.getConnection(connecting);
			System.out.println("Connection réussie !!");
		} catch (SQLException e1) {
			JOptionPane.showMessageDialog(jframe, e1);
		}
		
		try {
			stm = con.createStatement();
			System.out.println("Statut requête ok.");
		} catch (SQLException e1) {
			JOptionPane.showMessageDialog(jframe, e1);
		}

		try {
			rs = stm.executeQuery(query);
			rsmd = rs.getMetaData();
			System.out.println("Data recuperées.");
		} catch (SQLException e1) {
			System.out.println(e1);
		}
	}
	
	
	//Methode remplissage semanntique----------------------------------------------------------------------------------------------------
	//----------------------------------------------------------------------------------------------------------------------------------
	public static JComboBox comboBox(int index) {
		
		JComboBox cbx = new JComboBox();
		Request();
		
		try {
			while (rs.next()) {
				cpt ++;
				cbx.addItem(rs.getString(index));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cbx;
	}
	
	public static JTable table() {
		
		JTable tab = new JTable();
		Request();
		
		//tab.setModel(DbUtils.resultSetToTableModel(rs));
		System.out.println("line 96" + tab);
		return tab;
	}
}
