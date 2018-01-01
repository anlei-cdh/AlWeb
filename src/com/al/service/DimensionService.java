package com.al.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.al.basic.BasicServiceSupportImpl;
import com.al.dao.DimensionDao;
import com.al.model.Dimension;

@Service("dimensionService")
public class DimensionService extends BasicServiceSupportImpl {
	
	@Resource(name="dimensionDao")
	protected DimensionDao dimensionDao;
	
	/**
	 * Hive/MapReduce 流量统计
	 * @param dimension
	 * @return List<Dimension> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<Dimension> getOfflineList(Dimension dimension) {
		return (List<Dimension>)dimensionDao.selectList("common.dimension.getOfflineList", dimension);
	}
	
	/**
	 * Storm 国家分布
	 * @param dimension
	 * @return List<Dimension> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<Dimension> getStreamCountryList(Dimension dimension) {
		return (List<Dimension>)dimensionDao.selectList("common.dimension.getStreamCountryList", dimension);
	}
	
	/**
	 * Spark Streaming 地区分布
	 * @param dimension
	 * @return List<Dimension> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<Dimension> getStreamProvinceList(Dimension dimension) {
		return (List<Dimension>)dimensionDao.selectList("common.dimension.getStreamProvinceList", dimension);
	}
	
	/**
	 * Spark Core 流量统计
	 * @param dimension
	 * @return List<Dimension> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<Dimension> getMemoryList(Dimension dimension) {
		return (List<Dimension>)dimensionDao.selectList("common.dimension.getMemoryList", dimension);
	}
	
	/**
	 * Spark Core 维度信息
	 * @param dimension
	 * @return List<Dimension> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<Dimension> getMemoryDimensionList(Dimension dimension) {
		return (List<Dimension>)dimensionDao.selectList("common.dimension.getMemoryDimensionList", dimension);
	}
}