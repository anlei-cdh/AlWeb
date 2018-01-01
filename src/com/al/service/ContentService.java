package com.al.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.al.basic.BasicServiceSupportImpl;
import com.al.dao.ContentDao;
import com.al.model.Content;

@Service("contentService")
public class ContentService extends BasicServiceSupportImpl {
	
	@Resource(name="contentDao")
	protected ContentDao contentDao;
	
	/**
	 * Storm 国家稿件
	 * @param content
	 * @return List<Content> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<Content> getStreamCountryContentList(Content content) {
		return (List<Content>)contentDao.selectList("common.content.getStreamCountryContentList", content);
	}
	
	/**
	 * Spark Streaming 地区稿件
	 * @param content
	 * @return List<Content> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<Content> getStreamProvinceContentList(Content content) {
		return (List<Content>)contentDao.selectList("common.content.getStreamProvinceContentList", content);
	}
	
	/**
	 * Spark Core 稿件排行
	 * @param content
	 * @return List<Content> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<Content> getMemoryContentList(Content content) {
		return (List<Content>)contentDao.selectList("common.content.getMemoryContentList", content);
	}
	
}