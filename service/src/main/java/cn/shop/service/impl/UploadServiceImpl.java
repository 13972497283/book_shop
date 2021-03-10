package cn.shop.service.impl;

import cn.shop.service.UploadService;
import cn.shop.utils.BusinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@Service
public class UploadServiceImpl implements UploadService {
    @Autowired
    private HttpServletRequest request;

    private static final List<String> IMAGE_TYPES = Arrays.asList("image/jpeg", "image/gif","image/png");
    @Override
    public String upload(MultipartFile file) {
        try {
            String originalFilename = file.getOriginalFilename();
            System.out.println(originalFilename);
            String contentType = file.getContentType();
            UUID uuid = UUID.randomUUID();
            String path=uuid+"."+originalFilename.split("\\.")[1];
            if(!IMAGE_TYPES.contains(contentType)){
                return null;
            }
            BufferedImage read = ImageIO.read(file.getInputStream());
            if(read==null){
                return null;
            }
            file.transferTo(new File("F:\\nginx\\images\\"+path));
            return "http://image.shop.com/"+path;
        } catch (IOException e) {
            throw new BusinessException("文件上传错误");
        }
    }
}
