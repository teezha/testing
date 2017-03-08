<%@ page import="java.io.*,java.util.*,java.math.*"%>
<%

//to get the content type information from the form
String contentType = request.getContentType();

if (contentType != null) {
  DataInputStream d_in = new DataInputStream(request.getInputStream());
  out.println("starting file upload <br>"); 

// create an array to hold all bytes from form
  int num_form_bytes = request.getContentLength();
  byte dataBytes[] = new byte[num_form_bytes];

//  now copy the form bytes into the array
  int totalBytesRead = 0;
//  d_in.read(dataBytes,0,num_form_bytes);    // only works for small files
    d_in.readFully(dataBytes);
// figure out start position text file data within the content
  String formdata = new String(dataBytes); // convert the data to a string so we can search
  int startpos = 0;
  startpos = formdata.indexOf("Type: text");  //look for key words before start of text data
  if ( startpos == -1 )  {  // if did not find the start
        out.println("<BR> You do not upload a plain text file");
        return; // exit this program
  }

  String filetext = formdata.substring(startpos+20);  // get the uploaded file into a string
  String [] lines = filetext.split("\n");   // now we have each line of the file

// DECLARE THE VARIABLES TO USE IN THE FILE PROCESSING
// THESE ARE SUGGESTED VARS - YOU CAN CHANGE OR ADD YOUR OWN
  boolean prev_end_read=false,id_to_read=true,first_point=false;
  int lineid = 0;
  double length=0,x1=0.0,y1=0.0,x2=0.0,y2=0.0;
  String s1,s2;
  StringTokenizer st;

// NOW STEP THROUGH THE ARC EXPORT FILE LINE BY LINE
  for (int i=0; i<lines.length;i++) {
    st = new StringTokenizer(lines[i].trim()," ");
    s1 = st.nextToken();   // this is the 1st word on the line
    // the next 5 lines are just to help you see how the data is available to you
    // comment out these line once your code is ok
    out.println("The value of s1 is "+ s1 + "<br>");
    if (st.countTokens() > 0) { // if there is another word on the line
      s2 = st.nextToken();   // this is the 2nd word on the line
      out.println("The value of s2 is "+ s2 + "<br>");
    }

// YOU ADD YOUR CODE HERE TO PROCESS THE DATA
// AND OUTPUT EACH LINE ID AND LINE LENGTH

  } // for each line
  out.println("<BR> File processing completed");
}
 
%>
