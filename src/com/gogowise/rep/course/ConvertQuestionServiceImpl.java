package com.gogowise.rep.course;

import com.gogowise.rep.course.enity.Question;
import com.gogowise.rep.course.enity.QuestionItem;
import com.gogowise.rep.course.vo.question.Answer;
import com.gogowise.rep.course.vo.question.Doc;
import com.gogowise.rep.course.vo.question.Item;
import com.gogowise.rep.course.vo.question.Query;
import org.springframework.stereotype.Service;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service("convertQuestionService")
public class ConvertQuestionServiceImpl implements ConvertQuestionService {
    @Override
    public List<Question> convert(String patch) throws JAXBException {
        List<Question> questions = new ArrayList<>();
        try {
            JAXBContext jc = JAXBContext.newInstance(Doc.class);
            Unmarshaller unmarshaller = jc.createUnmarshaller();
            Doc collection = (Doc) unmarshaller.unmarshal(new File(patch));

            for(Query query : collection.getQueries()){
                Question question = new Question();
                question.setDescription(query.getQuestion());

                List<QuestionItem> items = new ArrayList<>();
                int i = 1;
                for (String item : query.getOpt().getItems()) {
                    QuestionItem questionItem = new QuestionItem();
                    questionItem.setDescription(item);
                    questionItem.setIndexValue(i + "");
                    questionItem.setIsAnswer( (i+"").equalsIgnoreCase(query.getAnswer()));
                    items.add(questionItem) ;
                    i++;
                }
                question.setQuestionItems(items);
                questions.add(question);
            }

        } catch (JAXBException e) {
            e.printStackTrace();
        }


        return questions;
    }

    public static void main(String args[]) throws JAXBException {
             ConvertQuestionServiceImpl convertQuestionService = new ConvertQuestionServiceImpl();
            convertQuestionService.convert("test.xml")  ;

    }
}
