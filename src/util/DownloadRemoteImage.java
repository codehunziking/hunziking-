package util;

import util.threadlocal.LocalRequestContextHolder;

import javax.servlet.http.HttpServletRequest;
import java.net.*;
import java.util.*;
import java.io.*;
import java.util.regex.*;

/**
 * 下载远程代码
 */
public class DownloadRemoteImage {
    // 字符编码
    private static final String ECODING = "UTF-8";
    // 获取图片的正则表达式
    private static final String IMGURL_REG = "<img.*src=(.*?)[^>]*?>";
    // 判断是否为远程图片的正则表达式
    private static final String IMGSRC_REG = "(http|https):\"?(.*?)(\"|>|\\s+)";

    /**
     * 根据编辑器内容获取远程的图片并保存在本地,并替换content 中的内容为本地连接地址
     */
    public static String run(String content)
    {
        HttpServletRequest request = LocalRequestContextHolder.getLocalRequestContext().getRequest();

        String path = "./upload";

        DownloadRemoteImage image = new DownloadRemoteImage();

        List<String> imgUrl = image.getImageUrl(content);

        String text = image.getImageSrc(content , imgUrl , path);
        //List<String> imgSrc = image.getImageSrc(imgUrl);
        //image.Download(imgSrc,path);
        return text;
    }


    /***
     * 获取ImageUrl地址
     */
    private List<String> getImageUrl(String HTML) {
        Matcher matcher = Pattern.compile(IMGURL_REG).matcher(HTML);
        List<String> listImgUrl = new ArrayList<String>();
        while (matcher.find()) {
            listImgUrl.add(matcher.group());
        }
        return listImgUrl;
    }

    /***
     * 获取ImageSrc地址
     */
    private String getImageSrc(String content , List<String> listImageUrl , String path) {
        //List<String> listImgSrc = new ArrayList<String>();

        for (String image : listImageUrl) {
            Matcher matcher = Pattern.compile(IMGSRC_REG).matcher(image);
            while (matcher.find()) {
                String src = matcher.group().substring(0, matcher.group().length() - 1);
                String newsFile = download(src , path);
                if(newsFile!= null){
                    content = content.replace(src , newsFile);
                }
            }
        }
        return content;
    }

    private static long downloadIndex = 1;

    /**
     * 根据url 生成保存的文件名
     */
    private String getFileName( String url )
    {
        //URL u = new URL(url);
        String ext = "png";
        String filename = new Date().getTime()+downloadIndex + "."+ext;
        downloadIndex++;
        return filename;
    }

    /**
     * 下载远程图片
     */
    private String download(String url, String path) {
        String result = "";
        String imageName = "";
        try {
            if(url.indexOf("http")>=0){
                imageName = getFileName( url ); //url.substring(url.lastIndexOf("/") + 1, url.length());
                URL uri = new URL(url);

                URLConnection conn = uri.openConnection();
                conn.setRequestProperty("Referer" , url);
                conn.setRequestProperty("User-Agent" , "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36");
                conn.setDoInput(true);

                InputStream in = conn.getInputStream();


                HttpServletRequest request = Request.getRequest();
                String paths = request.getSession().getServletContext().getRealPath(path);

                FileOutputStream fo = new FileOutputStream(new File(paths,imageName));
                byte[] buf = new byte[1024];
                int length = 0;
                System.out.println("开始下载:" + url);
                while ((length = in.read(buf, 0, buf.length)) != -1) {
                    fo.write(buf, 0, length);
                }
                in.close();
                fo.close();
                System.out.println(path+"/"+imageName + "下载完成");
            }
        } catch (Exception e) {
            System.out.println("下载失败");
            return null;
        }
        return path+"/"+imageName;
    }


}
