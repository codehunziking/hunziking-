package util.threadlocal;
import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LocalRequestContextHolder {
    private final static ThreadLocal<LocalRequestContext> contexts = new ThreadLocal<LocalRequestContext>();

    private LocalRequestContextHolder(){}

    public static void setLocalRequestContext(ServletContext servletContext, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        LocalRequestContext rc = new LocalRequestContext();
        rc.servletContext = servletContext;
        rc.request = httpServletRequest;
        rc.response = httpServletResponse;
        rc.session = httpServletRequest.getSession();
        rc.cookies = new HashMap<String, Cookie>();
        Cookie[] cookies = httpServletRequest.getCookies();
        if(cookies != null){
            for(Cookie ck : cookies) {
                rc.cookies.put(ck.getName(), ck);
            }
        }
        contexts.set(rc);
    }

    public static LocalRequestContext getLocalRequestContext(){
        return contexts.get();
    }

    public static void destoryLocalRequestContext() {
        contexts.remove();
    }
}
