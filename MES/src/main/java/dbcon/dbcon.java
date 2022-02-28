package dbcon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class dbcon {
	Connection con = null;
	String url = "jdbc:mysql://192.168.0.0115:3306/mes?" + "useUnicode=true&characterEncoding=utf8";
	String id = "Usera";
	String pw = "1234";
	int degree = 1;
	int inet_id = 1;

	public dbcon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void dbconnect() {
		try {
			con = DriverManager.getConnection(url, id, pw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Vector<estimatedb> estimatetable() {
		Vector<estimatedb> v = new Vector<estimatedb>();
		try {
			dbconnect();
			String sql = "select et_id, degree, et_com_id, et_price, et_date, et_explain from estimate order by et_id desc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				estimatedb es = new estimatedb();
				es.setEt_id(rs.getString("et_id"));
				es.setDegree(rs.getInt("degree"));
				es.setEt_com_name(rs.getString("et_com_id"));
				es.setEt_price(rs.getInt("et_price"));
				es.setEt_date(rs.getString("et_date"));
				String et_explain = rs.getString("et_explain");
				et_explain = et_explain.replace("\r\n", "!@#");
				es.setEt_explain(et_explain);
				v.add(es);
			}
			rs.close();
			pstmt.close();
			con.close();
			return v;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Vector<estimatedb> searchestimatetable(String searchword, String startdate, String enddate) {
		Vector<estimatedb> v = new Vector<estimatedb>();
		try {
			dbconnect();
			String sql = "";
			if (startdate != null && enddate != null) {
				sql = "select et_id, degree, et_com_id, et_price, et_explain, et_date from estimate where et_com_id like ? and et_date between ? and ? order by et_id desc";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + searchword + "%");
				pstmt.setString(2, startdate);
				pstmt.setString(3, enddate + " 23:59:59");
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					estimatedb es = new estimatedb();
					es.setEt_id(rs.getString("et_id"));
					es.setDegree(rs.getInt("degree"));
					es.setEt_com_name(rs.getString("et_com_id"));
					es.setEt_price(rs.getInt("et_price"));
					es.setEt_date(rs.getString("et_date"));
					String et_explain = rs.getString("et_explain");
					et_explain = et_explain.replace("\r\n", "!@#");
					es.setEt_explain(et_explain);
					v.add(es);
				}
				rs.close();
				pstmt.close();
				con.close();
			} else {
				sql = "select et_id, degree, et_com_id, et_price, et_explain, et_date from estimate where et_com_id like ? order by et_id desc";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + searchword + "%");
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					estimatedb es = new estimatedb();
					es.setEt_id(rs.getString("et_id"));
					es.setDegree(rs.getInt("degree"));
					es.setEt_com_name(rs.getString("et_com_id"));
					es.setEt_price(rs.getInt("et_price"));
					es.setEt_date(rs.getString("et_date"));
					String et_explain = rs.getString("et_explain");
					et_explain = et_explain.replace("\r\n", "!@#");
					es.setEt_explain(et_explain);
					v.add(es);
				}
				rs.close();
				pstmt.close();
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	public Vector<estimatedb> degreesearchestimatetable(String searchword, String startdate, String enddate) {
		Vector<estimatedb> v = new Vector<estimatedb>();
		try {
			dbconnect();
			if (startdate != null && enddate != null) {
				String sql = "select et_id, max(degree), et_com_id, et_price, et_date, et_explain from estimate where et_com_id like ? and et_date between ? and ? group by et_id order by et_id desc";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + searchword + "%");
				pstmt.setString(2, startdate);
				pstmt.setString(3, enddate + " 23:59:59");
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					estimatedb es = new estimatedb();
					es.setEt_id(rs.getString("et_id"));
					es.setDegree(rs.getInt("max(degree)"));
					es.setEt_com_name(rs.getString("et_com_id"));
					es.setEt_price(rs.getInt("et_price"));
					es.setEt_date(rs.getString("et_date"));
					String et_explain = rs.getString("et_explain");
					et_explain = et_explain.replace("\r\n", "!@#");
					es.setEt_explain(et_explain);
					v.add(es);
				}
				rs.close();
				pstmt.close();
				con.close();
			} else {
				String sql = "select et_id, max(degree), et_com_id, et_price, et_date, et_explain from estimate where et_com_id like ? group by et_id order by et_id desc";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + searchword + "%");
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					estimatedb es = new estimatedb();
					es.setEt_id(rs.getString("et_id"));
					es.setDegree(rs.getInt("max(degree)"));
					es.setEt_com_name(rs.getString("et_com_id"));
					es.setEt_price(rs.getInt("et_price"));
					es.setEt_date(rs.getString("et_date"));
					String et_explain = rs.getString("et_explain");
					et_explain = et_explain.replace("\r\n", "!@#");
					es.setEt_explain(et_explain);
					v.add(es);
				}
				rs.close();
				pstmt.close();
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	public void insertestimate(String et_id, String et_com_name, int et_price, String et_explain,
			String[] materialarray, String[] material_no) {
		try {
			dbconnect();
			String sql = "insert into estimate(et_id, et_com_id, degree, et_price, et_explain, et_date) values(?, ?, ?, ?, ?, sysdate())";
			String idsql = "select et_id from estimate order by et_id desc";
			String matersql = "insert into materials_et values(?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(idsql);
			ResultSet rs = pstmt.executeQuery();
			if (et_id == "") {
				if (rs.next()) {
					inet_id = rs.getInt("et_id") + 1;
				}
			} else {
				String degreesql = "select et_id, degree from estimate where et_id = " + et_id
						+ " order by degree desc";
				pstmt = con.prepareStatement(degreesql);
				rs = pstmt.executeQuery();
				rs.next();
				inet_id = rs.getInt("et_id");
				degree = rs.getInt("degree");
				degree += 1;
			}
			rs.close();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, inet_id);
			pstmt.setString(2, et_com_name);
			pstmt.setInt(3, degree);
			pstmt.setInt(4, et_price);
			pstmt.setString(5, et_explain);
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
			if (materialarray != null && material_no != null) {
				dbconnect();
				PreparedStatement pstmt2 = con.prepareStatement(matersql);
				for (int i = 0; i < materialarray.length; i++) {
					pstmt2.setInt(1, inet_id);
					pstmt2.setInt(2, degree);
					pstmt2.setString(3, materialarray[i]);
					pstmt2.setString(4, material_no[i]);
					pstmt2.executeUpdate();
				}
				pstmt2.close();
				con.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insertproc_cost(String[] standard_proc, String[] et_start, String[] et_end, String[] md,
			String[] cost) {
		try {
			if (standard_proc != null) {
				dbconnect();
				String sql = "insert into proc_cost values(?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, inet_id);
				pstmt.setInt(2, degree);
				for (int i = 0; i < standard_proc.length; i++) {
					pstmt.setString(3, standard_proc[i]);
					pstmt.setString(4, et_start[i]);
					pstmt.setString(5, et_end[i]);
					pstmt.setString(6, md[i]);
					pstmt.setString(7, cost[i]);
					pstmt.executeUpdate();
				}
				pstmt.close();
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertother_cost(String[] other_et_id, String[] othercost) {
		try {
			if (other_et_id != null) {
				dbconnect();
				String sql = "insert into other_cost(et_id, degree, other_et_id, cost) values(?, ?, ?, ?)";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, inet_id);
				pstmt.setInt(2, degree);
				for (int i = 0; i < other_et_id.length; i++) {
					pstmt.setString(3, other_et_id[i]);
					pstmt.setString(4, othercost[i]);
					pstmt.executeUpdate();
				}
				pstmt.close();
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Vector<String> selectcomname() {
		Vector<String> v = new Vector<String>();
		try {
			dbconnect();
			String sql = "select com_name from company";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				v.add(rs.getString("com_name"));
			}
			rs.close();
			pstmt.close();
			con.close();
			return v;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	/*
	 * public String comnametocomid(String com_name) { try { dbconnect(); String sql
	 * = "select com_id from company where com_name = '" + com_name + "'";
	 * PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs =
	 * pstmt.executeQuery(); rs.next(); String com_id = rs.getString("com_id");
	 * rs.close(); pstmt.close(); con.close(); return com_id; } catch (SQLException
	 * e) { e.printStackTrace(); } return null; }
	 * 
	 * public String comidtocomname(String com_id) { try { dbconnect(); String sql =
	 * "select com_name from company where com_id = '" + com_id + "'";
	 * PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs =
	 * pstmt.executeQuery(); rs.next(); String com_name = rs.getString("com_name");
	 * rs.close(); pstmt.close(); con.close(); return com_name; } catch
	 * (SQLException e) { e.printStackTrace(); } return null; }
	 */

	public void deleteestimate(String et_id, String degree) {
		try {
			dbconnect();
			String sql = "delete from estimate where et_id=? and degree = ?";
			String sql2 = "delete from materials_et where et_id = ? and degree = ?";
			String sql3 = "delete from proc_cost where et_id = ? and degree = ?";
			String sql4 = "delete from other_cost where et_id = ? and degree = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(et_id));
			pstmt.setInt(2, Integer.parseInt(degree));
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, Integer.parseInt(et_id));
			pstmt.setInt(2, Integer.parseInt(degree));
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(sql3);
			pstmt.setInt(1, Integer.parseInt(et_id));
			pstmt.setInt(2, Integer.parseInt(degree));
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(sql4);
			pstmt.setInt(1, Integer.parseInt(et_id));
			pstmt.setInt(2, Integer.parseInt(degree));
			pstmt.executeUpdate();

			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Vector<String> selectmaterialname() {
		Vector<String> v = new Vector<String>();
		try {
			dbconnect();
			String sql = "select materials_name from materials";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				v.add(rs.getString("materials_name"));
			}
			rs.close();
			pstmt.close();
			con.close();
			return v;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Vector<material_etdb> getmaterial_etdb(String et_id, String degree) {
		Vector<material_etdb> v = new Vector<material_etdb>();
		try {
			dbconnect();
			String sql = "select materials_no, quantity from materials_et where et_id = ? and degree = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, et_id);
			pstmt.setInt(2, Integer.parseInt(degree));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				material_etdb me = new material_etdb();
				me.setMaterials_no(rs.getString("materials_no"));
				me.setQuantity(rs.getString("quantity"));
				v.add(me);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return v;
	}

	public Vector<String> selectprocname() {
		Vector<String> v = new Vector<String>();
		try {
			dbconnect();
			String sql = "select process_name from process";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				v.add(rs.getString("process_name"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return v;
	}

	public Vector<proc_costdb> getproc_costdb(String et_id, String degree) {
		Vector<proc_costdb> v = new Vector<proc_costdb>();
		try {
			dbconnect();
			String sql = "select standard_proc, et_start, et_end, MD, cost from proc_cost where et_id = ? and degree = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, et_id);
			pstmt.setString(2, degree);
			ResultSet rs = pstmt.executeQuery(); 
			while (rs.next()) {
				proc_costdb pc = new proc_costdb();
				pc.setStandard_proc(rs.getString("standard_proc"));
				pc.setEt_start(rs.getString("et_start"));
				pc.setEt_end(rs.getString("et_end"));
				pc.setMd(rs.getInt("md"));
				pc.setCost(rs.getInt("cost"));
				v.add(pc);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return v;
	}

	public Vector<other_costdb> getother_cost(String et_id, String degree) {
		Vector<other_costdb> v = new Vector<other_costdb>();
		try {
			dbconnect();
			String sql = "select other_et_id, cost from other_cost where et_id = ? and degree = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, et_id);
			pstmt.setString(2, degree);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				other_costdb oc = new other_costdb();
				oc.setOther_et_id(rs.getString("other_et_id"));
				oc.setCost(rs.getString("cost"));
				v.add(oc);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	public Vector<estimatedb> degreetable() {
		Vector<estimatedb> v = new Vector<estimatedb>();
		try {
			dbconnect();
			String sql = "select et_id, max(degree), et_com_id, et_price, et_date, et_explain from estimate group by et_id order by et_id desc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				estimatedb es = new estimatedb();
				es.setEt_id(rs.getString("et_id"));
				es.setDegree(rs.getInt("max(degree)"));
				es.setEt_com_name(rs.getString("et_com_id"));
				es.setEt_price(rs.getInt("et_price"));
				es.setEt_date(rs.getString("et_date"));
				String et_explain = rs.getString("et_explain");
				et_explain = et_explain.replace("\r\n", "!@#");
				es.setEt_explain(et_explain);
				v.add(es);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	public Vector<String> selectother() {
		Vector<String> v = new Vector<String>();
		try {
			dbconnect();
			String sql = "select sub_code from code_sub where main_code = '기타견적'";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				v.add(rs.getString("sub_code"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	// -----------------------facilities-----------------------------------
	public Vector<facilitiesdb> facilitiestable() {
		Vector<facilitiesdb> v = new Vector<facilitiesdb>();
		try {
			dbconnect();
			String sql = "select facilities_name, facilities_status, pay, mes.facilities.using, using_all_day, facilities_start, facilities_end from facilities";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				facilitiesdb fc = new facilitiesdb();
				fc.setFacilities_name(rs.getString("facilities_name"));
				fc.setFacilities_status(rs.getString("facilities_status"));
				fc.setPay(rs.getString("pay"));
				fc.setUsing(rs.getString(4));
				fc.setUsing_all_day(rs.getString("using_all_day"));
				fc.setFacilities_start(rs.getString("facilities_start"));
				fc.setFacilities_end(rs.getString("facilities_end"));
				v.add(fc);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	public Vector<String> selectfacilities_status() {
		Vector<String> v = new Vector<String>();
		try {
			dbconnect();
			String sql = "select sub_code from code_sub where main_code = '설비현황'";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				v.add(rs.getString("sub_code"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	public void insertfacilities(String fn, String fs, String pay, String using, String uad, String fst, String fe) {
		try {
			dbconnect();
			String check = "select facilities_name from facilities where facilities_name = ?";
			String updatesql = "update facilities set facilities_status = ?, pay = ?, mes.facilities.using = ?, using_all_day = ?, facilities_start = ?, facilities_end = ? where facilities_name = ?";
			String insertsql = "insert into facilities values(?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(check);
			PreparedStatement pstmt2 = con.prepareStatement(updatesql);
			PreparedStatement pstmt3 = con.prepareStatement(insertsql);
			pstmt.setString(1, fn);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				pstmt2.setString(1, fs);
				pstmt2.setString(2, pay);
				pstmt2.setString(3, using);
				pstmt2.setString(4, uad);
				pstmt2.setString(5, fst);
				pstmt2.setString(6, fe);
				pstmt2.setString(7, fn);
				pstmt2.executeUpdate();
			}
			else {
				pstmt3.setString(1, fn);
				pstmt3.setString(2, fs);
				pstmt3.setString(3, pay);
				pstmt3.setString(4, using);
				pstmt3.setString(5, uad);
				pstmt3.setString(6, fst);
				pstmt3.setString(7, fe);
				pstmt3.executeUpdate();
			}
			rs.close();
			pstmt.close();
			pstmt2.close();
			pstmt3.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deletefacilities(String fn) {
		try {
			dbconnect();
			String sql = "delete from facilities where facilities_name = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fn);
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Vector<facilitiesdb> searchfacilities(String search) {
		Vector<facilitiesdb> v = new Vector<facilitiesdb>();
		try {
			dbconnect();
			String sql = "select facilities_name, facilities_status, pay, mes.facilities.using, using_all_day, facilities_start, facilities_end from facilities where facilities_name like ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				facilitiesdb fc = new facilitiesdb();
				fc.setFacilities_name(rs.getString("facilities_name"));
				fc.setFacilities_status(rs.getString("facilities_status"));
				fc.setPay(rs.getString("pay"));
				fc.setUsing(rs.getString(4));
				fc.setUsing_all_day(rs.getString("using_all_day"));
				fc.setFacilities_start(rs.getString("facilities_start"));
				fc.setFacilities_end(rs.getString("facilities_end"));
				v.add(fc);
			}
			rs.close();
			pstmt.close();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	//---------------------------place_order-------------------
	public Vector<manage_porderdb> manage_porderdbtable(){
		Vector<manage_porderdb> v = new Vector<manage_porderdb>();
		try {
			dbconnect();
			String sql = "select m_no, part_name, order_name, number_of_request, type from manage_porder";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				manage_porderdb mp = new manage_porderdb();
				mp.setM_no(rs.getInt("m_no"));
				mp.setPart_name(rs.getString("part_name"));
				if(rs.getString("order_name") == null) {
					mp.setOrder_name("");
				}
				else {
					mp.setOrder_name(rs.getString("order_name"));
				}
				mp.setNumber_of_request(rs.getInt("number_of_request"));
				mp.setType(rs.getString("type"));
				v.add(mp);
			}
			rs.close();
			pstmt.close();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	public Vector<manage_porderdb> searchmanage_porder(String searchpartname){
		Vector<manage_porderdb> v = new Vector<manage_porderdb>();
		try {
			dbconnect();
			String sql = "select m_no, part_name, order_name, number_of_request, type from manage_porder where part_name like ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchpartname+"%");	
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				manage_porderdb mp = new manage_porderdb();
				mp.setM_no(rs.getInt("m_no"));
				mp.setPart_name(rs.getString("part_name"));
				if(rs.getString("order_name") == null) {
					mp.setOrder_name("");
				}
				else {
					mp.setOrder_name(rs.getString("order_name"));
				}
				mp.setNumber_of_request(rs.getInt("number_of_request"));
				mp.setType(rs.getString("type"));
				v.add(mp);
			}
			rs.close();
			pstmt.close();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	public Vector<manage_porderdb> searchmanage_porder2(String searchpartname, String searchorder){
		Vector<manage_porderdb> v = new Vector<manage_porderdb>();
		try {
			dbconnect();
			String sql = "select m_no, part_name, order_name, number_of_request, type from manage_porder where part_name like ? and order_name like ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchpartname+"%");
			pstmt.setString(2, "%"+searchorder+"%");	
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				manage_porderdb mp = new manage_porderdb();
				mp.setM_no(rs.getInt("m_no"));
				mp.setPart_name(rs.getString("part_name"));
				if(rs.getString("order_name") == null) {
					mp.setOrder_name("");
				}
				else {
					mp.setOrder_name(rs.getString("order_name"));
				}
				mp.setNumber_of_request(rs.getInt("number_of_request"));
				mp.setType(rs.getString("type"));
				v.add(mp);
			}
			rs.close();
			pstmt.close();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	public void insertplace_order(String[] partname, String[] type, String[] nor, String com, String place, String[] price, String note){		
		try {
			dbconnect();
			String sql = "insert into place_order(part_name, type, "
					+ "number_of_request, porder_company, p_date, receiving_day, receiving_status, place_of_delivery, unit_price, note) values"
					+ "(?, ?, ?, ?, sysdate(), null, 'N', ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			for(int i=0; i<partname.length; i++) {
				pstmt.setString(1, partname[i]);
				pstmt.setString(2, type[i]);
				pstmt.setString(3, nor[i]);
				pstmt.setString(4, com);
				pstmt.setString(5, place);
				pstmt.setInt(6, Integer.parseInt(price[i]));
				pstmt.setString(7, note);
				pstmt.executeUpdate();
			}
			pstmt.close();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deletemanage_porder(String[] m_no) {
		try {
			dbconnect();
			String sql = "delete from manage_porder where m_no = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			for(int i=0; i<m_no.length; i++) {
				pstmt.setString(1, m_no[i]);
				pstmt.executeUpdate();
			}
			pstmt.close();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	//------------------------------------pminquiry----------------------------------
	
	public Vector<pmdb> pmtable(){
		Vector<pmdb> v = new Vector<pmdb>();
		try {
			dbconnect();
			String sql = "select part_type, part_name, unit_price, stock, safety_stock from part";
			String sql2 = "select materials_name, unit_price, stock, safety_stock from materials";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				pmdb pm = new pmdb();
				pm.setType(rs.getString("part_type"));
				pm.setPm_name(rs.getString("part_name"));
				pm.setPrice(rs.getString("unit_price"));
				pm.setStock(rs.getString("stock"));
				pm.setSafety_stock(rs.getString("safety_stock"));
				v.add(pm);
			}
			pstmt = con.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pmdb pm = new pmdb();
				pm.setType("자재");
				pm.setPm_name(rs.getString("materials_name"));
				pm.setPrice(rs.getString("unit_price"));
				pm.setStock(rs.getString("stock"));
				pm.setSafety_stock(rs.getString("safety_stock"));
				v.add(pm);
			}
			rs.close();
			pstmt.close();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	public Vector<String> selecttype() {
		Vector<String> v = new Vector<String>();
		try {
			dbconnect();
			String sql = "select sub_code from code_sub where main_code = '부품구분'";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				v.add(rs.getString("sub_code"));
			}
			rs.close();
			pstmt.close();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	public Vector<pmdb> searchpm(String searchtype, String searchpmname, String check){
		Vector<pmdb> v = new Vector<pmdb>();
		try {
			dbconnect();
			String sql = "";
			PreparedStatement pstmt;
			if(searchtype.equals("전체") && Integer.parseInt(check) == 0) {
				sql = "select part_type, part_name, unit_price, stock, safety_stock from part where part_name like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchpmname+"%");
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					pmdb pm = new pmdb();
					pm.setType(rs.getString("part_type"));
					pm.setPm_name(rs.getString("part_name"));
					pm.setPrice(rs.getString("unit_price"));
					pm.setStock(rs.getString("stock"));
					pm.setSafety_stock(rs.getString("safety_stock"));
					v.add(pm);
				}
				sql = "select materials_name, unit_price, stock, safety_stock from materials where materials_name like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchpmname+"%");
				rs = pstmt.executeQuery();
				while(rs.next()) {
					pmdb pm = new pmdb();
					pm.setType("자재");
					pm.setPm_name(rs.getString("materials_name"));
					pm.setPrice(rs.getString("unit_price"));
					pm.setStock(rs.getString("stock"));
					pm.setSafety_stock(rs.getString("safety_stock"));
					v.add(pm);
				}
				rs.close();
				pstmt.close();
				con.close();
			}
			else if(searchtype.equals("전체") && Integer.parseInt(check) == 1) {
				sql = "select part_type, part_name, unit_price, stock, safety_stock from part where part_name like ? and stock < safety_stock";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchpmname+"%");
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					pmdb pm = new pmdb();
					pm.setType(rs.getString("part_type"));
					pm.setPm_name(rs.getString("part_name"));
					pm.setPrice(rs.getString("unit_price"));
					pm.setStock(rs.getString("stock"));
					pm.setSafety_stock(rs.getString("safety_stock"));
					v.add(pm);
				}
				sql = "select materials_name, unit_price, stock, safety_stock from materials where materials_name like ? and stock < safety_stock";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchpmname+"%");
				rs = pstmt.executeQuery();
				while(rs.next()) {
					pmdb pm = new pmdb();
					pm.setType("자재");
					pm.setPm_name(rs.getString("materials_name"));
					pm.setPrice(rs.getString("unit_price"));
					pm.setStock(rs.getString("stock"));
					pm.setSafety_stock(rs.getString("safety_stock"));
					v.add(pm);
				}
				rs.close();
				pstmt.close();
				con.close();
			}
			else if(searchtype.equals("자재") && Integer.parseInt(check) == 0) {
				sql = "select materials_name, unit_price, stock, safety_stock from materials where materials_name like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchpmname+"%");
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					pmdb pm = new pmdb();
					pm.setType("자재");
					pm.setPm_name(rs.getString("materials_name"));
					pm.setPrice(rs.getString("unit_price"));
					pm.setStock(rs.getString("stock"));
					pm.setSafety_stock(rs.getString("safety_stock"));
					v.add(pm);
				}
				rs.close();
				pstmt.close();
				con.close();
			}
			else if(searchtype.equals("자재") && Integer.parseInt(check) == 1) {
				sql = "select materials_name, unit_price, stock, safety_stock from materials where materials_name like ? and stock < safety_stock";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchpmname+"%");
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					pmdb pm = new pmdb();
					pm.setType("자재");
					pm.setPm_name(rs.getString("materials_name"));
					pm.setPrice(rs.getString("unit_price"));
					pm.setStock(rs.getString("stock"));
					pm.setSafety_stock(rs.getString("safety_stock"));
					v.add(pm);
				}
				rs.close();
				pstmt.close();
				con.close();
			}
			else if(Integer.parseInt(check) == 0) {
				sql = "select part_type, part_name, unit_price, stock, safety_stock from part where part_name like ? and part_type = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchpmname+"%");
				pstmt.setString(2, searchtype);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					pmdb pm = new pmdb();
					pm.setType(rs.getString("part_type"));
					pm.setPm_name(rs.getString("part_name"));
					pm.setPrice(rs.getString("unit_price"));
					pm.setStock(rs.getString("stock"));
					pm.setSafety_stock(rs.getString("safety_stock"));
					v.add(pm);
				}
				rs.close();
				pstmt.close();
				con.close();
			}
			else if(Integer.parseInt(check) == 1) {
				sql = "select part_type, part_name, unit_price, stock, safety_stock from part where part_name like ? and part_type = ? and stock < safety_stock";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchpmname+"%");
				pstmt.setString(2, searchtype);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					pmdb pm = new pmdb();
					pm.setType(rs.getString("part_type"));
					pm.setPm_name(rs.getString("part_name"));
					pm.setPrice(rs.getString("unit_price"));
					pm.setStock(rs.getString("stock"));
					pm.setSafety_stock(rs.getString("safety_stock"));
					v.add(pm);
				}
				rs.close();
				pstmt.close();
				con.close();
			}
			else {
				sql = "select part_type, part_name, unit_price, stock, safety_stock from part";
				pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					pmdb pm = new pmdb();
					pm.setType(rs.getString("part_type"));
					pm.setPm_name(rs.getString("part_name"));
					pm.setPrice(rs.getString("unit_price"));
					pm.setStock(rs.getString("stock"));
					pm.setSafety_stock(rs.getString("safety_stock"));
					v.add(pm);
				}
				rs.close();
				pstmt.close();
				con.close();
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
}