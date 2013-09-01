package com.gogowise.urlfetch.hotel;

import com.gogowise.domain.Hotel;
import com.gogowise.urlfetch.sk.BaseJunitTest;
import org.junit.Test;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.File;
import java.util.Calendar;

public class CovertHotel  extends BaseJunitTest {
    @Test
    public  void convertAgoda() {
        try {
            //books.xsd生成的包名
            JAXBContext jc = JAXBContext.newInstance(Hotels.class);
            Unmarshaller unmarshaller = jc.createUnmarshaller();
            //注意这里的Collection是上面生成的不是java.util.Collection
//            Hotels collection = (Hotels) unmarshaller.unmarshal(new File("D:\\dev\\WorkSpace\\gogowise\\src\\com\\gogowise\\urlfetch\\hotel\\xml\\hotel.xml"));
            Hotels collection = (Hotels) unmarshaller.unmarshal(new File("D:\\dev\\WorkSpace\\gogowise\\src\\com\\gogowise\\urlfetch\\hotel\\xml\\hotel2.xml"));

            for(Hotel hotel : collection.getHotels()){
//                super.getModelDao().persistAbstract(hotel);
                logger.error(hotel.getCreateDate().get(Calendar.YEAR) +"====================");
            }
        } catch (JAXBException e) {
            e.printStackTrace();
        }
    }

    public static void main(String args[]) {
       int i =new CovertHotel().test2213();
    }

    public int test2213() {
        return 1;
    }


}
