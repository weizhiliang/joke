package com.doumiao.joke.schedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.doumiao.joke.enums.ArticleType;

@Component
public class CacheSchedule {
	private static final Log log = LogFactory.getLog(CacheSchedule.class);
	@Resource
	private JdbcTemplate jdbcTemplate;

	@Scheduled(fixedDelay = 60000)
	protected void refreshConfig() {
		if (log.isDebugEnabled()) {
			log.debug("refresh config");
		}
		List<Map<String, Object>> configs = jdbcTemplate
				.queryForList("select * from joke_config");
		for (Map<String, Object> c : configs) {
			Config.set((String) c.get("key"), (String) c.get("value"));
		}
	}

	@Scheduled(fixedDelay = 600000)
	protected void refreshHotText() {
		if (log.isDebugEnabled()) {
			log.debug("refresh hot text");
		}
		List<Map<String, Object>> articles = jdbcTemplate
				.queryForList(
						"select a.*,m.nick,m.avatar from joke_article a,uc_member m where a.member_id=m.id and a.`status` = 2 and type = ? order by up desc,id desc limit 0, 1000",
						ArticleType.TEXT.name());
		if (articles != null && articles.size() > 0) {
			Cache.set(Cache.Key.HOT_TEXT, articles);
		}
	}
	
	@Scheduled(fixedDelay = 600000)
	protected void refreshHotPic() {
		if (log.isDebugEnabled()) {
			log.debug("refresh hot pic");
		}
		List<Map<String, Object>> articles = jdbcTemplate
				.queryForList(
						"select a.*,m.nick,m.avatar from joke_article a,uc_member m where a.member_id=m.id and a.`status` = 2 and type = ? order by up desc,id desc limit 0, 100",
						ArticleType.PIC.name());
		if (articles != null && articles.size() > 0) {
			Cache.set(Cache.Key.HOT_PIC, articles);
		}
	}

	@Scheduled(fixedDelay = 600000)
	protected void refreshAd() {
		if (log.isDebugEnabled()) {
			log.debug("refresh ad");
		}
		List<Map<String, Object>> ads = jdbcTemplate.queryForList(
				"select * from `ad_script` where `status` = 0");
		Map<String, Map<String,Map<String, Object>>> adMap = new HashMap<String, Map<String,Map<String, Object>>>();
		for (Map<String, Object> ad : ads) {
			String pos = (String)ad.get("position");
			Map<String,Map<String, Object>> l = adMap.get(pos);
			if(l==null){
				l = new HashMap<String,Map<String, Object>>();
				adMap.put(pos, l);
			}
			l.put("ad" + ad.get("id"), ad);
		}
		if (adMap.size() > 0) {
			Cache.set(Cache.Key.AD, adMap);
		}
	}
}
