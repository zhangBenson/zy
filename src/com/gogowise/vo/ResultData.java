package com.gogowise.vo;

import java.io.Serializable;

/**
 * Created by Peter Young on 14-2-21.
 */
public class ResultData<T> implements Serializable {
    private T data;
    private int result;
    private String message;

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
