package com.example.ekka.paging;

import org.springframework.core.MethodParameter;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import com.example.ekka.dto.ResponseDataTableDto;

public class PagingResolver implements HandlerMethodArgumentResolver {
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.getParameterAnnotation(PagingParam.class) != null;
    }

    @Override
    public Object resolveArgument(MethodParameter parameter,
                                  ModelAndViewContainer mavContainer, // <=> Model
                                  NativeWebRequest webRequest, // HttpServletRequest
                                  WebDataBinderFactory binderFactory) throws Exception {
        PagingParam pagingParam = parameter.getParameterAnnotation(PagingParam.class);
        String path = pagingParam.path();
        String pageStr = webRequest.getParameter("page");
        Integer page = StringUtils.isEmpty(pageStr) ? 1 : Integer.valueOf(pageStr);
        page = page <= 0 ? 1 : page;
        String perpageStr = webRequest.getParameter("perpage");
        Integer perpage = StringUtils.isEmpty(perpageStr) ? 5 : Integer.valueOf(perpageStr);
        perpage = perpage < 0 ? 5 : perpage;
        String key = webRequest.getParameter("key");
        return new ResponseDataTableDto(path, page, perpage, key, mavContainer);
    }
}
