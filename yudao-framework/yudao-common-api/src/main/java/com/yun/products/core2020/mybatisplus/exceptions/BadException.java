package com.yun.products.core2020.mybatisplus.exceptions;

public class BadException extends RuntimeException {

    public BadException() {
        super();
    }

    public BadException(String message) {
        super(message);
    }

    public BadException(String message, Throwable cause) {
        super(message, cause);
    }

    public BadException(Throwable cause) {
        super(cause);
    }

    protected BadException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
