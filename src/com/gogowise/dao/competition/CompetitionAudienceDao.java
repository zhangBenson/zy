package com.gogowise.dao.competition;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.CompetitionAudience;
import com.gogowise.domain.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-17
 * Time: 下午3:37
 * To change this template use File | Settings | File Templates.
 */
public interface CompetitionAudienceDao extends ModelDao<CompetitionAudience> {
    public List<CompetitionAudience> findCompetitionByUserId(Integer Uid,Pagination page);

    public void saveCompetitionAudience(CompetitionAudience competitionAudience);

    public CompetitionAudience findCompetitionAudienceByUserIdCid(Integer Uid,Integer Cid);
}
