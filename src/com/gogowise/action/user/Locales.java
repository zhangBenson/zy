package com.gogowise.action.user;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-9-9
 * Time: 上午11:00
 * To change this template use File | Settings | File Templates.
 */
import net.sf.cglib.core.Local;

import java.util.Hashtable;
 import java.util.Locale;
 import java.util.Map;
public class Locales {




    private Locale current;

    // 设置当前用户的语言种类
    public void setCurrent(Locale current) {
       this.current = current;
    }

  public Map<String, Locale> getLocales() {
      Map<String, Locale> locales = new Hashtable<String, Locale>();

      // 往集合中装载语言种类
     // Locale locale = Locale.getDefault();

           locales.put("简体中文", Locale.CHINA);
           locales.put("English", Locale.US);
      //Locale.

      return locales;

   }
}
