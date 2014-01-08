package com.gogowise.rep.course.vo.question;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * Created by benson on 14-1-6.
 */
@XmlRootElement(name="doc")
public class Doc {


    private List<Query> queries;

    @XmlElement(name="query")
    public List<Query> getQueries() {
        return queries;
    }

    public void setQueries(List<Query> queries) {
        this.queries = queries;
    }
}
