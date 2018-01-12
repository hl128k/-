package com.meizu.help;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.meizu.daofactory.DaoFactory;

public class headhelp extends DaoFactory {
	public static List<Map<String, Object>> getHeadIdList() {
		return DaoFactory.excuteQuery(" select distinct id,name from head",
				null);
	}

	public static Map<String, List<Map<String, Object>>> getHeadmap() {
		Map<String, List<Map<String, Object>>> headmap = new HashMap<String, List<Map<String, Object>>>();
		for (Map<String, Object> map : getHeadIdList()) {
			String id = map.get("id").toString();
			String name = map.get("name").toString();
			List<Map<String, Object>> list = DaoFactory.excuteQuery(
					"select*from commodity where id in(select Cid from head where id="
							+ id + ")", null);
			headmap.put(name, list);
		}
		return headmap;
	}
}
