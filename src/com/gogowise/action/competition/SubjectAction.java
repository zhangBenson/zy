package com.gogowise.action.competition;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.competition.SubjectDao;
import com.gogowise.rep.competition.enity.Subject;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class SubjectAction extends BasicAction {

    /**
     *
     */
    private static final long serialVersionUID = 202155741102217063L;
    private SubjectDao subjectDao;
    private Subject subject;

    public String init() {
        if (this.getSubject() != null && this.getSubject().getId() != null) {
            this.subject = subjectDao.findById(this.getSubject().getId());
        }
        return SUCCESS;
    }

    public String save() {
        subjectDao.persistAbstract(subject);
        return SUCCESS;
    }

    public void validateSave() {
        List<Subject> dbS = subjectDao.findByExample(subject);
        if (dbS != null && dbS.size() > 0) {
            addFieldError("name", "名子已存在，请用选用其他的名子");
        }
    }

    public SubjectDao getSubjectDao() {
        return subjectDao;
    }

    public void setSubjectDao(SubjectDao subjectDao) {
        this.subjectDao = subjectDao;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }
}
