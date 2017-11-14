package fileControl;

import java.io.File;

public class deleteFile {

    public static void main(String[] args) {
        File file = new File("/Users/kagoshin/tutorial/workspace/JAVA_EXAM/resouceFileCtrl/writeFile.txt");

        if (file.delete()) {
            System.out.println("success to delete a file.");
        } else {
            System.out.println("fail to delete a file.");
        }
    }
}
