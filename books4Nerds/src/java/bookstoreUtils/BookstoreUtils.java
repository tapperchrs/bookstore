/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstoreUtils;
import java.sql.*;
/**
 *
 * @author tduffy
 */
public class BookstoreUtils {
    public static String getLink(String href, String text){
        StringBuffer sb = new StringBuffer(256);
        sb.append("<a href=\"" + href + "\">");
        sb.append(text);
        sb.append("</a>");
        return sb.toString();
    }
    
    public static String getTable(ResultSet rs, int border, boolean header, int hotColumn, int pKey, String target){
        //Note - hotColumn is 1-based
        
        String qs = null;
        String data = null;
        String link = null;
        try{
            StringBuffer sb = new StringBuffer(2048);
            sb.append("<table border=\"" + border + "\" width=\"100%\" cellpadding=\"4\">\n");
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            if(header){
                sb.append("<tr>\n");
                for(int i=1; i<=columnCount; i++){
                    sb.append("<th>" + rsmd.getColumnLabel(i) + "</th>\n");
                }
                sb.append("</tr>\n");
            }
            while(rs.next()){
                sb.append("<tr>\n");
                for(int i=1; i<=columnCount; i++){
                    sb.append("<td>");
                    if(i==pKey){
                        qs = rs.getString(i);
                        sb.append(qs + "</td>\n");
                    }else if(i==hotColumn){
                        data = rs.getString(i);
                        link = getLink(target + "?" + rsmd.getColumnLabel(pKey) + "=" + qs,data);
                        sb.append(link + "</td>\n");
                    }else{
                        sb.append(rs.getString(i));
                        sb.append("</td>\n");
                    }
                }
                sb.append("</tr>\n");
            }
            sb.append("</table>");
            return sb.toString();
        
        }catch(Exception e){
            return qs;
        }
    }
}
