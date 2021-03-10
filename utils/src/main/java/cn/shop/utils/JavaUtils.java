package cn.shop.utils;

/**
 * 工具类
 */
public class JavaUtils {
    /**
     * 计算开始结束页
     * @param page 当前页
     * @param size  总页数
     * @return
     */
    public static Integer[]  calculationStartEnd(Integer page,Integer size){
        int begin;
        int end;
        if(size<5){
            begin=1;
            end=size;
        }
        else{
            begin=page-2;
            end=page+2;
            if(begin<1){
                begin=1;
                end=begin+4;
            }
            if(end>size){
                end=size;
                begin=end-4;
            }
        }
        return new Integer[]{begin,end};
    }
}
