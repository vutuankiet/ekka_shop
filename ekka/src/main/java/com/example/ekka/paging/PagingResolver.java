package com.example.ekka.paging;

import com.example.ekka.dto.ResponseDataTableProductDto;
import org.springframework.core.MethodParameter;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import com.example.ekka.dto.ResponseDataTableDto;

import java.util.Objects;

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
        Integer perpage = StringUtils.isEmpty(perpageStr) ? 12 : Integer.valueOf(perpageStr);
        perpage = perpage <= 0 ? 12 : perpage;
        String key = webRequest.getParameter("key");
        String sort = webRequest.getParameter("sort");
        String category = webRequest.getParameter("category");
        String genderCategory = webRequest.getParameter("genderCategory");
        String brand = webRequest.getParameter("brand");
        String firstPriceStr = webRequest.getParameter("firstPrice");
        float firstPrice = StringUtils.isEmpty(firstPriceStr) ? 0 : Float.parseFloat(firstPriceStr);
        String lastPriceStr = webRequest.getParameter("lastPrice");
        float lastPrice = StringUtils.isEmpty(lastPriceStr) ? 250 : Float.parseFloat(lastPriceStr);
        return new ResponseDataTableDto(path, page, perpage, key, category, genderCategory, brand, sort, firstPrice, lastPrice, mavContainer);
    }
}
