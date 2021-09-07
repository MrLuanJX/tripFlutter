import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cyeshop/cy_http_config.dart';

class CYHttpRequest{
  //有3中超时：连接超时、发送超时、接受服务器回应超时
  static final BaseOptions baseOptions = BaseOptions(baseUrl:CYHTTPConfig.baseURL ,connectTimeout:CYHTTPConfig.connectTimeOut );
  static final Dio dio = Dio();
  static Future<T> request<T>(String url,{String method = "get",Map<String,dynamic> params,Interceptor interceptor}) async {
    // 创建请求配置
    final option = Options(method: method);
    // 创建全局的拦截器(默认拦截器)
    // onrequest：请求拦截
    // onResponse： 响应拦截
    // onError: 错误拦截
    Interceptor defaultInterceptor = InterceptorsWrapper(
      onRequest:(options){//请求拦截
        print("请求拦截");
        return options;
      },
      onResponse: (response){
        print("响应拦截");
        return response;//响应拦截
      },
      onError: (error){//错误拦截
        print("错误拦截");
        return error;
      }
    );
    List<Interceptor> interceptors = [defaultInterceptor];
    if(interceptor != null){//将自定义拦截器加入
      interceptors.add(interceptor);
    }
    // 统一添加到拦截区中
    dio.interceptors.addAll(interceptors);
    // 发送请求
    // Response response = await dio.request(url,queryParameters: params,options: option);
    // return response.data;
    try{
      Response response = await dio.request(url,queryParameters: params,options: option);
      return response.data;
    }on DioError catch(error){
      return Future.error(error);
    }
  }
}

class CYHTTPConfig{
  static const String baseURL = "https://httpbin.org";
  static const int connectTimeOut = 5000;//毫秒
}
