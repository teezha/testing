<%@page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="java.io.*,java.util.StringTokenizer,javax.servlet.ServletContext,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.regex.Pattern" %>
<% 

    
    
    //to get the content type information from the form
    String contentType = request.getContentType();
    String fileName =request.getParameter("F2");

    if (contentType != null) {
        
        out.println("starting file upload <br>");
        String filepath = "H:\\var\\gist\\8100\\Mod4\\mod4app\\web\\arclines.txt";


// DECLARE THE VARIABLES TO USE IN THE FILE PROCESSING
// THESE ARE SUGGESTED VARS - YOU CAN CHANGE OR ADD YOUR OWN
        int lineid = 0;
        int endCount = 0;
        double length = 0, x1 = 0.0, y1 = 0.0, x2 = 0.0, y2 = 0.0;
        StringTokenizer st;
        
       try{
        File bufferFile = new File(String.valueOf(filepath));
        
        
        String regex = "\\b[0-9].*\\s\\b[0-9].*";
        String strregex = "[a-zA-Z]{3}";
        Pattern pattern = Pattern.compile(regex);
        Pattern strPattern = Pattern.compile(strregex);
        BufferedReader reader = new BufferedReader(new FileReader(bufferFile));
        String line;



            while ((line = reader.readLine()) != null){
                

                
                Matcher matcher = pattern.matcher(line.trim());
                Matcher strMatcher = strPattern.matcher(line.trim());
                if (strMatcher.find()) {
                    endCount++;
                    if (endCount > 1) {
                        out.print("<br>END OF FILE");
                        break;
                    }
                    out.print("<br>Line ID:" + lineid + " is " + length + "m long.\n");
                    length = 0;
                    lineid = 0;
                    x1=0;
                    y1=0;
                } else if (matcher.find()) {
                    st = new StringTokenizer(line.trim(), " ");
                    x2 = Double.valueOf(st.nextToken());
                    y2 = Double.valueOf(st.nextToken());
                    if (x1!=0|y1!=0){
                        length += Math.sqrt(Math.pow((x2 - x1), 2.0) + Math.pow((y2 - y1), 2.0));
                    }
                    x1 = x2;
                    y1 = y2;


                } else {
                    lineid = Integer.parseInt(line.trim());
                    endCount=0;
                }
            }
      
        out.println("<BR> File processing completed");

    } catch (IOException e) {
            e.printStackTrace();
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }



%>