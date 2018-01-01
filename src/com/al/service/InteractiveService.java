package com.al.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.al.basic.BasicServiceSupportImpl;
import com.al.dao.InteractiveDao;
import com.al.model.Interactive;

public class InteractiveService extends BasicServiceSupportImpl {
	
	private InteractiveDao interactiveDao = new InteractiveDao();

	/**
	 * Impala 新闻热搜词
	 * @return List<Interactive> 查询结果
	 */
	public List<Interactive> getKeywordList() {
		List<Interactive> list = interactiveDao.getKeywordList();
		for(Interactive interactive : list) {
			interactive.setKeyword(interactive.getKeyword().replace(" ", ""));
		}
		return list;
	}
	
	/**
	 * Kudu 五大门户信息
	 * @return List<Interactive> 查询结果
	 */
	public List<Interactive> getPortalList() {
		List<Interactive> list = interactiveDao.getPortalList();
		Collections.sort(list, new Comparator<Interactive>() {
			@Override
			public int compare(Interactive o1, Interactive o2) {
				return Integer.compare(o1.getRate(), o2.getRate());
			}
		});
		int index = 1;
		for(Interactive interactive : list) {
			interactive.setIndex(index);
			index++;
		}
		Collections.sort(list, new Comparator<Interactive>() {
			@Override
			public int compare(Interactive o1, Interactive o2) {
				return Integer.compare(o2.getCount(), o1.getCount());
			}
		});
		return list;
	}
}