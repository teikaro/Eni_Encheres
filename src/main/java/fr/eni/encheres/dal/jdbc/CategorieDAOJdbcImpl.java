package fr.eni.encheres.dal.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import fr.eni.encheres.bo.Categories;
import fr.eni.encheres.dal.CategorieDAO;
import fr.eni.encheres.dal.ConnectionProvider;

public class CategorieDAOJdbcImpl implements CategorieDAO{

	private static final String SELECT_ALL = "SELECT * FROM Categories";

	@Override
	public List<Categories> selectCategorie() {
		List<Categories> liste = new ArrayList<>();
		
		try 
			(Connection cnx = ConnectionProvider.getConnection()){
				Statement selectAll = cnx.createStatement();
				ResultSet rs = selectAll.executeQuery(SELECT_ALL);
				
				while(rs.next()) {
					Categories categorie = new Categories(rs.getInt("no_categorie"), rs.getString("libelle"));
					//System.out.println(categorie.toString());
					liste.add(categorie);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return liste;
		}
	}


