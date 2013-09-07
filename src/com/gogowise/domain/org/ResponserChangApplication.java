package com.gogowise.domain.org;


import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.org.Organization;

import javax.persistence.Entity;

@Entity
public class ResponserChangApplication extends AbstractPersistence {
   private Organization organization;
   private String applicantName;
   private String applicantEmail;
   private String applicantTelphone;
   private String disposeName;
}
