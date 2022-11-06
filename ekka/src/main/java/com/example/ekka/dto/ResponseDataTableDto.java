package com.example.ekka.dto;

import lombok.Data;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.method.support.ModelAndViewContainer;
import com.example.ekka.dao.PagingDAO;
import com.example.ekka.repository.SearchingRepository;

import java.util.List;
import java.util.Objects;

@Data
public class ResponseDataTableDto {
    String path;
    Integer page;
    Integer perpage;
    Integer numberPage;
    Integer total;
    String category;
    String genderCategory;
    Float firstPrice;
    Float lastPrice;
    List<?> data;
    String key;
    String sort;
    ModelAndViewContainer model;

    public ResponseDataTableDto(String path, Integer page, Integer perpage, String key, String category, String genderCategory,String sort,float firstPrice, float
            lastPrice, ModelAndViewContainer model) {
        this.path = path;
        this.page = page;
        this.perpage = perpage;
        this.model = model;
        this.key = key;
        this.category = category;
        this.genderCategory = genderCategory;
        this.firstPrice = firstPrice;
        this.lastPrice = lastPrice;
        this.sort = sort;
    }

    public void list1(PagingDAO dao) throws Exception {
        this.setData(dao.list(page, perpage));
        int total = dao.count();
        this.setTotal(total);
        this.setNumberPage((int) Math.ceil((double) total / perpage));
        model.addAttribute("list", this);
    }

//    public void list1(JpaRepository repository) throws Exception {
//        Pageable pageable = PageRequest.of(page-1, perpage);
//        Page<?> pages = repository.findAll(pageable);
//        this.setData(pages.getContent());
//        long total = pages.getTotalElements();
//        this.setTotal((int)total);
//        this.setNumberPage((int) Math.ceil((double) total / perpage));
//        model.addAttribute("list", this);
//    }

    public void list(SearchingRepository searchingRepository) throws Exception {
        if(sort == null){
            Pageable pageable = PageRequest.of(page-1, perpage,Sort.by(Sort.Direction.DESC, "created_at"));
            Page<?> pages = searchingRepository.findAllProduct(key == null?"":key,category == null?"":category,genderCategory == null?"":genderCategory, firstPrice, lastPrice, pageable);
            this.setData(pages.getContent());
            long total = pages.getTotalElements();
            this.setTotal((int)total);
            this.setNumberPage((int) Math.ceil((double) total / perpage));
            System.out.println("sort: "+ this);
            model.addAttribute("list", this);
        }
        if(Objects.equals(sort, "AtoZ")){
            Pageable pageable = PageRequest.of(page-1, perpage,Sort.by(Sort.Direction.ASC, "productName"));
            Page<?> pages = searchingRepository.findAllProduct(key == null?"":key,category == null?"":category,genderCategory == null?"":genderCategory, firstPrice, lastPrice, pageable);
            this.setData(pages.getContent());
            long total = pages.getTotalElements();
            this.setTotal((int)total);
            this.setNumberPage((int) Math.ceil((double) total / perpage));
            System.out.println("sort: "+ this);
            model.addAttribute("list", this);
        }
        if(Objects.equals(sort, "ZtoA")){
            Pageable pageable = PageRequest.of(page-1, perpage,Sort.by(Sort.Direction.DESC, "productName"));
            Page<?> pages = searchingRepository.findAllProduct(key == null?"":key,category == null?"":category,genderCategory == null?"":genderCategory, firstPrice, lastPrice, pageable);
            this.setData(pages.getContent());
            long total = pages.getTotalElements();
            this.setTotal((int)total);
            this.setNumberPage((int) Math.ceil((double) total / perpage));
            System.out.println("sort: "+ this);
            model.addAttribute("list", this);
        }
        if(Objects.equals(sort, "LowToHigh")){
            Pageable pageable = PageRequest.of(page-1, perpage,Sort.by(Sort.Direction.ASC, "priceProduct"));
            Page<?> pages = searchingRepository.findAllProduct(key == null?"":key,category == null?"":category,genderCategory == null?"":genderCategory, firstPrice, lastPrice, pageable);
            this.setData(pages.getContent());
            long total = pages.getTotalElements();
            this.setTotal((int)total);
            this.setNumberPage((int) Math.ceil((double) total / perpage));
            System.out.println("sort: "+ this);
            model.addAttribute("list", this);
        }
        if(Objects.equals(sort, "HighToLow")){
            Pageable pageable = PageRequest.of(page-1, perpage,Sort.by(Sort.Direction.DESC, "priceProduct"));
            Page<?> pages = searchingRepository.findAllProduct(key == null?"":key,category == null?"":category,genderCategory == null?"":genderCategory, firstPrice, lastPrice, pageable);
            this.setData(pages.getContent());
            long total = pages.getTotalElements();
            this.setTotal((int)total);
            this.setNumberPage((int) Math.ceil((double) total / perpage));
            System.out.println("sort: "+ this);
            model.addAttribute("list", this);
        }
    }
}
