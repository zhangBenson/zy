package com.gogowise.dao.impl;

import com.gogowise.dao.SubjectDao;
import com.gogowise.domain.Subject;
import org.springframework.stereotype.Repository;

@Repository("subjectDao")
public class SubjectDaoImpl extends ModelDaoImpl<Subject> implements SubjectDao {


}
