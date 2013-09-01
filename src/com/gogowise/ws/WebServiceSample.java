package com.gogowise.ws;

import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;


@WebService
public interface WebServiceSample {


    boolean logon(String email, String password);

    String say(String hello);


    String sayUserName(
            @WebParam(name = "user")
            UserDTO user);


    public
    @WebResult(partName = "o")
    ListObject findUsers();

}