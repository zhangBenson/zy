package com.gogowise.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "User")
public class UserDTO {  
  
    protected Integer id;  
  
    protected String name;  
  
    public Integer getId() {  
        return id;  
    }  
  
    public void setId(Integer value) {  
        id = value;  
    }  
  
    public String getName() {  
        return name;  
    }  
  
    public void setName(String value) {  
        name = value;  
    }  
}  