package com.gogowise.rep.competition;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.domain.competition.Subject;
import org.springframework.stereotype.Repository;

@Repository("subjectDao")
public class SubjectDaoImpl extends ModelDaoImpl<Subject> implements SubjectDao {


}
