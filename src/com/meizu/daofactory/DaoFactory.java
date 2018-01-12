package com.meizu.daofactory;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DaoFactory {
	static {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		Connection con = null;
		String url = "jdbc:sqlserver://localhost:1433;databasename=meizu";
		try {
			con = DriverManager.getConnection(url, "sa", "123456");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	public static PreparedStatement getPrepareStatement(String sql,
			Object... obj) {
		PreparedStatement ps = null;
		Connection con = getConnection();
		try {
			ps = con.prepareStatement(sql);
			if (null != obj) {
				for (int i = 0; i < obj.length; i++) {
					ps.setObject(i + 1, obj[i]);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ps;
	}

	/**
	 * ¸üÐÂ
	 * 
	 * @param sql
	 * @param obj
	 * @return
	 */
	public static int excute(String sql, Object... obj) {
		int row = 0;
		PreparedStatement ps = getPrepareStatement(sql, obj);
		try {
			row = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(null, ps, null);
		}
		return row;
	}

	public static void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if (null != con) {
				con.close();
			}
			if (null != ps) {
				ps.close();
			}
			if (null != rs) {
				rs.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static List<Map<String, Object>> excuteQuery(String sql,
			Object... obj) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		PreparedStatement ps = getPrepareStatement(sql, obj);
		ResultSet rs = null;
		try {
			rs = ps.executeQuery();
			ResultSetMetaData rsm = rs.getMetaData();
			int clums = rsm.getColumnCount();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				for (int i = 1; i <= clums; i++) {
					String name = rsm.getColumnName(i);
					map.put(name, rs.getObject(name));
				}
				list.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(null, ps, rs);
		}

		return list;

	}

	public static int executeCall(String sql, Object... obj) {
		CallableStatement callsm = null;
		Connection con = null;
		int re = 0;
		try {
			con = getConnection();
			callsm = con.prepareCall(sql);
			callsm.registerOutParameter(obj.length + 1, java.sql.Types.INTEGER);
			if (null != obj) {
				for (int i = 0; i < obj.length; i++) {
					callsm.setObject(i + 1, obj[i]);
				}
			}
			callsm.execute();
			re = callsm.getInt(obj.length + 1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, callsm, null);
		}
		return re;

	}
}
