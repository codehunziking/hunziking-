package dao;

import java.util.*;

/**
 * 让ArrayList 可以获取所有键
 */
public class QueryData<k,t> extends LinkedHashMap<k,t> {
    public QueryData(){
        super();
    }

    /**
     * 获取所有键
     */
    public ArrayList<String> keys()
    {
        Set keys = this.keySet();
        ArrayList<String> result = new ArrayList(keys.size());
        Iterator iter = keys.iterator();
        while(iter.hasNext()){
            result.add((String)iter.next());
        }
        return result;
    }
}
