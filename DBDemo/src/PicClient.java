import java.io.*;
import java.net.*;
import java.util.Scanner;

public class PicClient {
    public static void main(String args[]) throws Exception {
        Scanner scan = new Scanner(System.in);

        //while (str != "over") {
        Socket s = new Socket("0.0.0.0", 10006);
        String str = scan.next();
        FileInputStream fis = new FileInputStream(str);

        OutputStream out = s.getOutputStream();

        byte[] buf = new byte[1024];

        int len = 0;
        while ((len = fis.read(buf)) != -1) {

            out.write(buf, 0, len);
        }

        s.shutdownOutput();
        InputStream in = s.getInputStream();

        byte[] bufIn = new byte[1024];

        int num = in.read(bufIn);
        System.out.println(new String(bufIn, 0, num));

        fis.close();
        s.close();

        //}
    }
}