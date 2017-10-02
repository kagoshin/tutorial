package com.example.datasource;

import java.util.ArrayList;
import java.util.List;

public abstract class AbstractDatasource<T> {

	/**
	 * DBから取得する体でモデルを返す。
	 * @return モデルリスト
	 */
	public List<T> findAll() {
		List<T> list = new ArrayList<>();
		long count = 1000L;
		for(long i=1L; i<=count; i++) {
			list.add(createModel(i));
		}
		return list;
	}
	
	/**
	 * DBから取得する体でモデルを返す。
	 * @param id
	 * @return モデル
	 */
	public T findById(Long id) {
		return createModel(id);
	}
	
	/**
	 * conditionのidに指定された値分だけスリープしてからモデルを返す。
	 * @param condition
	 * @return モデル
	 */
	public T findWithComplexCondition(Condition condition) {
		Long waitTime = condition.getId();
		try {
			Thread.sleep(waitTime);
		} catch(InterruptedException ex) {}
		return createModel(condition.getId());
	}
	
	abstract T createModel(Long id);
}
