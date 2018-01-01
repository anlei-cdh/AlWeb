package com.al.dao;

import java.sql.Connection;
import java.util.List;

import com.al.basic.BasicDao;
import com.al.database.DBHelper;
import com.al.model.Interactive;

public class InteractiveDao {
	
	/**
	 * Impala 新闻热搜词
	 * @return List<Interactive> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<Interactive> getKeywordList() {
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT keywords keyword FROM `al_parquet` WHERE keywords IS NOT NULL LIMIT 180";
		List<Interactive> list = null;
		try {
			list = (List<Interactive>)BasicDao.getSqlList(sql, Interactive.class, conn);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(conn);
		}
		return list;
	}
	
	/**
	 * Kudu 五大门户信息
	 * @return List<Interactive> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<Interactive> getPortalList() {
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT `name`,`count`,rate FROM `al_kudu` ORDER BY COUNT DESC LIMIT 5";
		List<Interactive> list = null;
		try {
			list = (List<Interactive>)BasicDao.getSqlList(sql, Interactive.class, conn);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(conn);
		}
		return list;
	}
	
	public static void main(String[] args) {
		List<Interactive> list = new InteractiveDao().getKeywordList();
		for(Interactive interactive : list) {
			System.out.println(interactive.getKeyword());
		}
	}
}
