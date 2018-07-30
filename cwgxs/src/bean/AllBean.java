package bean;

import java.util.ArrayList;

public class AllBean {
	SelectBean sb = new SelectBean();
	ArrayList al = null;
	
	public ArrayList getDogType(String type){
		String sql = "select * from dog where type="+type;
		String args[] = {"id","name","author","publishing","number","price","storage","brief","type","tate","sums","imgpath"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getType(){
		String sql = "select * from types";
		String[] args = {"id","name"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getAfter(){
		String sql = "select * from after";
		String args[] = {"id","name","phone","times","content"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getAfter(String id){
		String sql = "select * from after where id="+id;
		String args[] = {"id","name","phone","times","content"};
		al = sb.select(args, sql);
		return al;
	}
}
