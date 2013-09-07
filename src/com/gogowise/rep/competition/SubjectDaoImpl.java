package com.gogowise.rep.competition;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.competition.enity.Subject;
import org.springframework.stereotype.Repository;

@Repository("subjectDao")
public class SubjectDaoImpl extends ModelDaoImpl<Subject> implements SubjectDao {


}
