package com.eu.front.dto;


public class Result {

    private boolean result;

    private Object data;

    private String msg;

    public Result(boolean result) {
        this.result = result;
    }

    public Result(boolean result, String msg) {
        this.result = result;
        this.data = msg;
    }

    public Result(boolean result, Object data) {
        this.result = result;
        this.data = data;
    }

    public Result(boolean result, Object data, String msg) {
        this.result = result;
        this.data = data;
        this.msg = msg;
    }

    public static Result success() {
        return new Result(true);
    }

    public static Result success(Object obj, String msg) {
        return new Result(true, obj, msg);
    }

    public static Result failure(Object obj, String msg) {
        return new Result(false, obj, msg);
    }

    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
