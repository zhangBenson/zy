package com.gogowise.dao.competition;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.competition.CompetitionDaoImpl;
import com.gogowise.domain.Subject;
import org.springframework.stereotype.Repository;

@Repository("subjectDao")
public class SubjectDaoImpl extends ModelDao.ModelDaoImpl<Subject> implements CompetitionDaoImpl.SubjectDao {


}
