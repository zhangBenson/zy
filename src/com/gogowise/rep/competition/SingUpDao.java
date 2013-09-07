package com.gogowise.rep.competition;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.competition.enity.Competition;
import com.gogowise.rep.competition.enity.CompetitionSession;
import com.gogowise.rep.competition.enity.SingUpInfo;
import com.gogowise.rep.competition.enity.SingerAllocation;
import com.gogowise.rep.user.user.BaseUser;
import com.gogowise.rep.user.user.Comments;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: 11-8-7
 * Time: 下午8:23
 * To change this template use File | Settings | File Templates.
 */
public interface SingUpDao extends ModelDao<SingUpInfo> {

    public SingUpInfo findSingUpInfoByUserId(Integer Id);

    public Map<String, String> findSessionByTypeForSelector(Integer competitionId, Integer type);

    public SingUpInfo findSingUpInfoByEmail(String email);

    public Competition findCompetitionById(Integer id);

    public BaseUser findUserById(Integer id);

    public CompetitionSession findSessionById(Integer id);

    public void persistAllocation(SingerAllocation sa);

    public boolean isAllocationByUserId(Integer userId, Integer competitionId);

    public List<SingUpInfo> findByPage(Pagination page);

    public List<CompetitionSession> findForcastByUser(Integer id, Pagination page);

    public List<CompetitionSession> findAgeByUser(Integer id, Pagination page);

    public void saveComments(Comments comments);

    public List<Comments> listAllComments(Integer userId);

    public List<CompetitionSession> findOngoing(Pagination page);

    public List<CompetitionSession> findForcast(Pagination page);

    public Integer logon(String email, String password);

    public BaseUser findUserByEmail(String email);

    public void persistAll(SingUpInfo singUpInfo);
}
