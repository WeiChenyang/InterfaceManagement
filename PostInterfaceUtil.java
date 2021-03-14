package com.cnbmtech.sys.util;

import com.cnbm.sdk.util.CnbmEncryptUtil;
import com.cnbm.sdk.vo.EncryptBean;
import com.cnbmtech.sys.util.exception.ActivitiException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;


/**
 * U8接口请求
 */
@Slf4j
public class PostInterfaceUtil {

    /**
     * http请求
     */
    public String sendPost(String url, String param,String code) throws ActivitiException {
        log.info(">>>>>>>>PostInterfaceUtil.sendPost url:"+url+",param:"+param+",code:"+code);
        try {
            String token = "";
            EncryptBean encryptBean = new EncryptBean(code);
            token = CnbmEncryptUtil.setheaderEncrypt(encryptBean);
            String restresponse = null;
            HttpClient httpClient = new HttpClient();
            PostMethod post = new PostMethod(url);
            HttpMethod method = post;
            post.addRequestHeader("token", token);
            if (param != null) {
                RequestEntity se = new StringRequestEntity(param, "application/json", "UTF-8");
                post.setRequestEntity(se);
            }
            try {
                httpClient.executeMethod(method);
                restresponse = method.getResponseBodyAsString();
                log.info("===================restresponse:" + restresponse);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                post.releaseConnection();
            }
            return restresponse;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
