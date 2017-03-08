import java.io.*;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static java.lang.System.out;

/**
 * Created by a00987765 on 3/7/2017.
 */
public class tester {


    public static void main(String[] args) throws FileNotFoundException {


        int lineid = 0;
        int endCount = 0;
        double length = 0, x1 = 0.0, y1 = 0.0, x2 = 0.0, y2 = 0.0;
        String s1, s2;
        StringTokenizer st;

        String regex = "\\b[0-9].*\\s\\b[0-9].*";
        String strregex = "[a-zA-Z]{3}";
        Pattern pattern = Pattern.compile(regex);
        Pattern strPattern = Pattern.compile(strregex);
        //request.getInputStream
        try (BufferedReader reader = new BufferedReader(new FileReader("H:\\var\\gist\\8100\\Mod4\\mod4app\\web\\arclines.txt"))) {


            for (String line; (line = reader.readLine().trim()) != null; )

            {

                Matcher matcher = pattern.matcher(line.trim());
                Matcher strMatcher = strPattern.matcher(line.trim());
                if (strMatcher.find()) {
                    endCount++;
                    if (endCount > 1) {
                        System.out.print("END OF FILE");
                        break;
                    }
                    System.out.print("Line ID:" + lineid + " is " + length + "m long.\n<br>");
                    length = 0;
                    lineid = 0;
                } else if (matcher.find()) {
                    st = new StringTokenizer(line, " ");
                    x2 = Double.valueOf(st.nextToken());
                    y2 = Double.valueOf(st.nextToken());
                    length += Math.sqrt(Math.pow((x2 - x1), 2.0) + Math.pow((y2 - y1), 2.0));
                    x1 = x2;
                    y1 = y2;


                } else {
                    lineid = Integer.parseInt(line);
                    endCount=0;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

