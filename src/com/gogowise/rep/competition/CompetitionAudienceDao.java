package com.gogowise.rep.competition;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.competition.enity.CompetitionAudience;
import com.gogowise.rep.Pagination;

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
