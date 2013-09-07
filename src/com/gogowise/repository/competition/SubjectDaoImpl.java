package com.gogowise.repository.competition;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.competition.Subject;
import org.springframework.stereotype.Repository;

@Repository("subjectDao")
public class SubjectDaoImpl extends ModelDaoImpl<Subject> implements SubjectDao {


}
