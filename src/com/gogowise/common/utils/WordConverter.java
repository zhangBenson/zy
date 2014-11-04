package com.gogowise.common.utils;

import com.gogowise.rep.course.enity.Question;
import com.gogowise.rep.course.enity.QuestionItem;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class WordConverter {
    private static final Logger logger = LogManager.getLogger(WordConverter.class);
    public static final String TITLE_REGEX = "([0-9]*)\\.(.)*";
    public static final String ITEM_REG = "\\(([0-9]*)\\)";


    private String srcPath;
    private Map<String, Question> questionMap = new HashMap<>();
    private List<Question> questions = new ArrayList<>();
    private Question currentQuestion;


    public void convert(String fullName, Integer userId) throws Exception {
//        String BASE_PATCH = "D:\\dev\\WorkSpace\\zy\\WebRoot.war\\";
        String BASE_PATCH = UploadUtils.getRealPathForBaseDir();
        srcPath = BASE_PATCH + Constants.UPLOAD_PATH + userId + "/" + fullName;
        String ext = UploadUtils.getExtension(fullName);
        InputStream is = null;
        try {
            is = new FileInputStream(srcPath);
            String text;
            if (".doc".equalsIgnoreCase(ext)) {
                text = getTextFromDoc(is);
            } else {
                text = getTextFromDocx(is);
            }

            boolean isAnswerPart = false;
            for (String s : text.split("\n")) {
                String line = StringUtils.trim(s);
                if (StringUtils.isBlank(line))
                    continue;
                logger.info(line);
                if ("Answers".equalsIgnoreCase(line)) {
                    isAnswerPart = true;
                    continue;
                }
                try {
                    if (isAnswerPart) {
                        parserAnswer(line);
                    } else {
                        parseQuestion(line);
                    }
                } catch (Exception e) {
                    throw new Exception("Parser ERROR Line:" + line);
                }
            }
        } finally {
            if (is != null) {
                is.close();
            }
        }


    }

    private void parserAnswer(String line) {
        String[] answerArray = StringUtils.split(line, ".");
        if (answerArray.length < 2) {
            return;
        }
        String key = StringUtils.trim(answerArray[0]);
        String value = StringUtils.trim(answerArray[1]);

        for (QuestionItem item : questionMap.get(key).getQuestionItems()) {
            if (value.equalsIgnoreCase(item.getIndexValue())) {
                item.setIsAnswer(true);
            }
        }
    }

    public String getTextFromDocx(InputStream is) throws Exception {
        XWPFWordExtractor extractor = new XWPFWordExtractor(new XWPFDocument(is));
        return extractor.getText();
    }

    public String getTextFromDoc(InputStream is) throws Exception {
        WordExtractor extractor = new WordExtractor(is);
        return extractor.getText();
    }


    private void parseQuestion(String line) {

        Matcher titleMatcher = Pattern.compile(TITLE_REGEX).matcher(line);
        if (titleMatcher.find()) {
            this.currentQuestion = new Question();
            this.questionMap.put(titleMatcher.group(1), currentQuestion);
            this.questions.add(currentQuestion);
            this.currentQuestion.setDescription(titleMatcher.group(2));
        } else {
            Matcher itemMatcher = Pattern.compile(ITEM_REG).matcher(line);
            List<String> indexes = new ArrayList<>();
            while (itemMatcher.find()) {
                indexes.add(itemMatcher.group(1));
            }
            for (int i = 0; i < indexes.size(); i++) {
                QuestionItem item = new QuestionItem();
                item.setIndexValue(indexes.get(i));
                if (i + 1 == indexes.size()) {
                    item.setDescription(StringUtils.substring(line, StringUtils.indexOf(line, "(" + indexes.get(i) + ")") + 3).replaceAll("\\(\\s+\\)", ""));
                } else {
                    item.setDescription(StringUtils.substring(line, StringUtils.indexOf(line, "(" + indexes.get(i) + ")") + 3, StringUtils.indexOf(line, "(" + indexes.get(i + 1) + ")")));
                }
                currentQuestion.addQuestionItems(item);
            }

        }
    }
//    public static void main(String[] args) throws Exception {
//        WordConverter wordConverter = new WordConverter();
//        wordConverter.convert("7.DOC",11);
//    }

    public List<Question> getQuestions() {
        return questions;
    }
}
