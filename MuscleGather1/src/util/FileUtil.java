package util;

import java.io.*;

public class FileUtil {
	public static void saveImage(String root, String fname, byte[] data)
	throws IOException {
		root += "/images";	// 사진 저장
		
		File f = new File(root);
		if(!f.exists()) f.mkdir();	// 없으면 객체 생성 후 만든다
		
		f = new File(root + "/" + fname);
		FileOutputStream out = new FileOutputStream(f);
		out.write(data);
		out.close();
	}
}
