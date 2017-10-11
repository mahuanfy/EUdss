package com.eu.manage.entity;


import java.util.*;

/**封装分页的参数
 * Created by 马欢欢 on 2017/5/29.
 */
public class PageBean {
    private int pageCurrent=1;//当前页
    private int pageCount=10;//每页显示的行数（查询返回的行数）默认每页显示4行
    private int index;//起始查询位置
    private int totalCount;//总记录数
    private int totalPage;//总页数=总记录数、每页显示的行数（有余数+1）
    private List<TronClass> pageData;//分页查询到的数据
    private int rank;//权限查询时的判断条件

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public int getIndex() {

        return index;
    }

    public void setIndex(int index) {

        this.index = index;
    }

    public int getPageCurrent() {
        if(totalCount % pageCount == 0){
            this.totalPage = totalCount / pageCount;
        }else {
            this.totalPage = totalCount / pageCount +1;
        }
        return pageCurrent;
    }

    public void setPageCurrent(int pageCurrent) {
        this.pageCurrent = pageCurrent;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<TronClass> getPageData() {
        return pageData;
    }

    public void setPageData(List<TronClass> pageData) {
        this.pageData = pageData;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "pageCurrent=" + pageCurrent +
                ", pageCount=" + pageCount +
                ", index=" + index +
                ", totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", pageData=" + pageData +
                '}';
    }
}
