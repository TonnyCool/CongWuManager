package bean;

import java.util.ArrayList;

public class UserBean {
		SelectBean sb = new SelectBean();
		
		public ArrayList getUser(String id){
			String sql = "select * from users where id="+id;
			String args[] = {"id","name","pwd","realname","sex","age","card","address","phone","email","code"};
			ArrayList al = sb.select(args, sql);
			return al;
		}
}
