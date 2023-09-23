package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.category;
import com.tech.blog.entities.post;
public class postdao {
Connection con;
public postdao(Connection con) {
	this.con=con;
}
public ArrayList<category> getAllCategories(){
	ArrayList<category> list=new ArrayList<>();
	try{
	String q="select * from categories"	;
	Statement st=this.con.createStatement();
	ResultSet set=st.executeQuery(q);
	while(set.next()) {
		int cid=set.getInt("cid");
		String name=set.getString("name");
		String description=set.getString("description");
        category c=new category(cid,name,description);
        list.add(c);
	}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return list;
}
public boolean savepost(post p) {
	boolean f=false;
	try{
String q="insert into post(ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?) ";
PreparedStatement pstmt=con.prepareStatement(q);
  pstmt.setString(1,p.getPtitle());
  pstmt.setString(2,p.getPcontent());
  pstmt.setString(3,p.getPcode());
  pstmt.setString(4,p.getPpic());
  pstmt.setInt(5,p.getCatid());
  pstmt.setInt(6,p.getUserid());
  pstmt.executeUpdate();
  f=true;
	}catch(Exception e){
		e.printStackTrace();
	}
	return f;
}

public List<post> getallposts(){
	List<post> list=new ArrayList<>();
	try {
		PreparedStatement p=con.prepareStatement("Select* from post order by pid desc");
        ResultSet set=p.executeQuery();
        while(set.next()) {
        	int pid=set.getInt("pid");
        	String ptitle=set.getString("ptitle");
        	String pcontent=set.getString("pcontent");
        	String pcode=set.getString("pcode");
        	String ppic=set.getString("ppic");
        	Timestamp date=set.getTimestamp("pdate");
        	int catid=set.getInt("catid");
        	int userid=set.getInt("userid");
        	post post=new post(pid,ptitle,pcontent,pcode,ppic,date,catid,userid);
        	list.add(post);
        }
	}catch(Exception e) {
		e.printStackTrace();
	}
	return list;
}


public List<post> getpostbycatid(int catid){
	List<post> list=new ArrayList<>();
	try {
		PreparedStatement p=con.prepareStatement("Select* from post where catid=?");
		p.setInt(1, catid);
        ResultSet set=p.executeQuery();
        while(set.next()) {
        	int pid=set.getInt("pid");
        	String ptitle=set.getString("ptitle");
        	String pcontent=set.getString("pcontent");
        	String pcode=set.getString("pcode");
        	String ppic=set.getString("ppic");
        	Timestamp date=set.getTimestamp("pdate");

        	int userid=set.getInt("userid");
        	post post=new post(pid,ptitle,pcontent,pcode,ppic,date,catid,userid);
        	list.add(post);
        }
	}catch(Exception e) {
		e.printStackTrace();
	}
	return list;
}
public post getpostbypostid(int postid)  {
	post post=null;
	String q="select * from post where pid=?";
	try {
		PreparedStatement p=this.con.prepareStatement(q);
		p.setInt(1,postid);
		ResultSet set=p.executeQuery();
		if(set.next()) {
	
			int pid=set.getInt("pid");
        	String ptitle=set.getString("ptitle");
        	String pcontent=set.getString("pcontent");
        	String pcode=set.getString("pcode");
        	String ppic=set.getString("ppic");
        	Timestamp date=set.getTimestamp("pdate");
             int cid=set.getInt("catid");
        	int userid=set.getInt("userid");
        	post=new post(pid,ptitle,pcontent,pcode,ppic,date,cid,userid);
			
		}
	}catch(Exception e) {
		
		e.printStackTrace();
	}
	return post;
}

}
