package com.event.model;

import java.util.List;

public interface EventDAO {

	public String insert(EventVO eventVO);

	public void update(EventVO eventVO);

	public void delete(String event_id);

	public EventVO findByPrimaryKey(String event_id);

	public List<EventVO> getAll();
	
	public List<EventVO> findByBandId(String band_id);
	
	//====================
		public List<EventVO> findByName(String event_title);
	
}
