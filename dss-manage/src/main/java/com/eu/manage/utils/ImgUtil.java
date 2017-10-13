package com.eu.manage.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class ImgUtil {

    private static String getSuffixName(String imgName) {
        return imgName.substring(imgName.lastIndexOf("."), imgName.length());
    }

    public static String saveImg(MultipartFile file, String dir) {
        String filePath = dir + UUID.randomUUID().toString() + ".jpg";

        try {
            file.transferTo(new File(filePath));
//            rotateImage(filePath,-90,null);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return filePath;
    }

    private static void rotateImage(String targetImg, int degree, Color bgcolor) throws IOException {

        File file = new File(targetImg);
        BufferedImage sourceImage = ImageIO.read(file);
        int iw = sourceImage.getWidth();//原始图象的宽度
        int ih = sourceImage.getHeight();//原始图象的高度
        int w = 0;
        int h = 0;
        int x = 0;
        int y = 0;
        degree = degree % 360;
        if (degree < 0)
            degree = 360 + degree;//将角度转换到0-360度之间
        double ang = Math.toRadians(degree);//将角度转为弧度

        /**
         *确定旋转后的图象的高度和宽度
         */

        if (degree == 180 || degree == 0 || degree == 360) {
            w = iw;
            h = ih;
        } else if (degree == 90 || degree == 270) {
            w = ih;
            h = iw;
        } else {
            int d = iw + ih;
            w = (int) (d * Math.abs(Math.cos(ang)));
            h = (int) (d * Math.abs(Math.sin(ang)));
        }

        x = (w / 2) - (iw / 2);//确定原点坐标
        y = (h / 2) - (ih / 2);
        BufferedImage rotatedImage = new BufferedImage(w, h, sourceImage.getType());
        Graphics2D gs = (Graphics2D)rotatedImage.getGraphics();
        if(bgcolor==null){
            rotatedImage  = gs.getDeviceConfiguration().createCompatibleImage(w, h, Transparency.TRANSLUCENT);
        }else{
            gs.setColor(bgcolor);
            gs.fillRect(0, 0, w, h);//以给定颜色绘制旋转后图片的背景
        }

        //有两种旋转使用方式，第一使用AffineTransformOp，第二使用Graphics2D
       /*
        * AffineTransform at = new AffineTransform();
        at.rotate(ang, w / 2, h / 2);//旋转图象
        at.translate(x, y);
        AffineTransformOp op = new AffineTransformOp(at, AffineTransformOp.TYPE_BICUBIC);
        op.filter(sourceImage, rotatedImage);
        sourceImage = rotatedImage;

        ImageIO.write(sourceImage, "PNG", file);//这里的格式化请使用PNG格式，否则旋转后会出现红眼效果
*/

        BufferedImage bufferedImage = new BufferedImage(w, h, sourceImage.getType());
        Graphics2D g = bufferedImage.createGraphics();
        if(bgcolor==null){
            g.setColor(Color.WHITE);
        }else{
            g.setColor(bgcolor);
        }
        g.fillRect(0, 0, w, h);//以给定颜色绘制旋转后图片的背景

        g.rotate(Math.toRadians(degree), w/2, h/2);
        g.translate(x, y);
        g.drawImage(sourceImage, 0, 0, null);
        g.dispose();

        ImageIO.write(bufferedImage, "jpg", file);
    }
}
