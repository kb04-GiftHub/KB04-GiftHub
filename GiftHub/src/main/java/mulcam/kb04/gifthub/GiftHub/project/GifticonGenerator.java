package mulcam.kb04.gifthub.GiftHub.project;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontFormatException;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;

import mulcam.kb04.gifthub.GiftHub.dto.ProductDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;

public class GifticonGenerator {
	
	private static String productImageFile;
	private static String expirationDate;
	
	public static String createGiftCard(HttpSession ses,ProductDto product,String barcodeData, StoreDto store, Date expDate) throws FontFormatException, IOException {
		int width = 350; // 이미지 너비
        int height = 650; // 이미지 높이
        BufferedImage giftCardImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = giftCardImage.createGraphics();
	    
        productImageFile = product.getProductImage();
        
        SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");
        expirationDate= format.format(expDate);
        String productTitle = product.getProductName();
        
        // 배경 색상 설정
        g2d.setColor(Color.WHITE);
        g2d.fillRect(0, 0, width, height);
        
        //로고 이미지 그리기
        try {
        	String upDir=System.getProperty("user.dir");
        	String rootDirectory = upDir+"/src/main/resources/static/img";
        	String productImagePath = rootDirectory+"/"+"logo.png";
            BufferedImage logoImage = ImageIO.read(new File(productImagePath));
            g2d.drawImage(logoImage, 115, 25, 120, 35, null);
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        //폰트설정
        String font=System.getProperty("user.dir");
    	String fontDirectory = font+"/src/main/resources/static/font/IBMPlexSansKR-Medium.ttf";
//    	String fontDirectory = font+"/src/main/resources/static/font/NanumPenScript-Regular.ttf";
    	Font customFont = Font.createFont(Font.TRUETYPE_FONT, new File(fontDirectory));
    	
    	
        // 상품 이미지 그리기
        try {
        	ServletContext app =ses.getServletContext();
        	String rootDirectory = app.getRealPath("/resources/products");
			/*
			 * String upDir=System.getProperty("user.dir"); String rootDirectory =
			 * upDir+"/src/main/resources/static/upload_images/product";
			 */
        	String productImagePath = rootDirectory+"/"+productImageFile;
            BufferedImage productImage = ImageIO.read(new File(productImagePath));
            int imageWidth = 300;
            int imageHeight = 280;
            int imageX = 25;
            int imageY = 70;
            int imageCenterX = imageX + imageWidth /2;
            g2d.drawImage(productImage, imageX, imageY, imageWidth, imageHeight, null);
            
            g2d.setColor(Color.BLACK); // 테두리의 색상 설정
//            g2d.setFont(new Font("함초롬돋움",Font.BOLD, 20));
            g2d.setFont(customFont.deriveFont(Font.BOLD, 20));
            FontMetrics fontMetrics = g2d.getFontMetrics();
            int titleDateWidth = fontMetrics.stringWidth(productTitle);
            int titleDateX = imageCenterX - (titleDateWidth / 2);
            int titleDateY = imageY + imageHeight + 35; // 바코드 아래에 위치
            g2d.drawString(productTitle, titleDateX, titleDateY);
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        // 바코드 생성을 위한 코드(날짜와시간+시퀀스)
        BufferedImage barcodeImage = barcodeGenerate(barcodeData);

        int barcodeWidth = 350;
        int barcodeHeight = 70;
        int barcodeX = 0;
        int barcodeY = 410;

        // 바코드 이미지 크기를 맞추기 위해 스케일 조정
        BufferedImage scaledBarcodeImage = new BufferedImage(barcodeWidth, barcodeHeight, BufferedImage.TYPE_INT_RGB);
        Graphics2D barcodeGraphics = scaledBarcodeImage.createGraphics();
        barcodeGraphics.drawImage(barcodeImage, 0, 0, barcodeWidth, barcodeHeight, null);
        barcodeGraphics.dispose();

        // 바코드 그리기
        g2d.drawImage(scaledBarcodeImage, barcodeX, barcodeY, null);

        // 바코드 중앙 위치 계산
        int barcodeCenterX = barcodeX + barcodeWidth / 2;

        // 코드 번호 텍스트 그리기 (가운데 정렬)
        g2d.setColor(Color.BLACK); // 테두리의 색상 설정
//        g2d.setFont(new Font("Digital-7",Font.BOLD, 15));
        g2d.setFont(customFont.deriveFont(Font.BOLD, 15));
        
        StringBuilder builder = new StringBuilder(barcodeData);
        builder.insert(4, "-");
        builder.insert(10, "-");
        builder.insert(15,"-");
        barcodeData=builder.toString();
        FontMetrics fontMetrics = g2d.getFontMetrics();
        int expirationDateWidth = fontMetrics.stringWidth(barcodeData);
        int expirationDateX = barcodeCenterX - (expirationDateWidth / 2);
        int expirationDateY = barcodeY + barcodeHeight + 20; // 바코드 아래에 위치
        g2d.drawString(barcodeData, expirationDateX, expirationDateY);
        
        
        float lineWidth = 1.5f; // 원하는 굵기로 조절
        BasicStroke stroke = new BasicStroke(lineWidth);
        g2d.setStroke(stroke);
        
        //테두리
        g2d.setColor(Color.BLACK); // 테두리의 색상 설정
        g2d.drawRoundRect(7, 15, 336, 620, 20, 20);
        
        //선
        g2d.setColor(Color.GRAY);
        g2d.drawLine( 30, 525, 320,525);
        g2d.setColor(Color.GRAY); // 
//        g2d.setFont(new Font("나눔 고딕",Font.PLAIN, 14));
        g2d.setFont(customFont.deriveFont(Font.PLAIN, 14));
        g2d.drawString("교 환 처", 30,548 );
        g2d.setColor(Color.BLACK);  
//        g2d.setFont(new Font("HYShortSamul 중간",Font.BOLD, 16));
        g2d.setFont(customFont.deriveFont(Font.BOLD, 16));
        g2d.drawString(store.getStoreName(),200,545);
        
        // 
        g2d.setColor(Color.GRAY);
        g2d.drawLine( 30, 555, 320,555);
        g2d.setColor(Color.GRAY); // 
//        g2d.setFont(new Font("나눔 고딕",Font.PLAIN, 14));
        g2d.setFont(customFont.deriveFont(Font.PLAIN, 14));
        g2d.drawString("유효기간", 30,583 );
        g2d.setColor(Color.BLACK);  
//        g2d.setFont(new Font("HYPost",Font.BOLD, 16));
        g2d.setFont(customFont.deriveFont(Font.BOLD, 16));
//        Date date = product.getProductExp();
//        SimpleDateFormat form = new SimpleDateFormat("yyyy년 MM월 dd일");
//        expirationDate=form.format(date);
        g2d.drawString(expirationDate,170,580);
        
        g2d.setColor(Color.GRAY);
        g2d.drawLine( 30, 590, 320,590);
        g2d.setColor(Color.GRAY); // 
        
        g2d.dispose();
        
        String gifticonName = null;
		try {
			UUID uuid = UUID.randomUUID();
			gifticonName = uuid.toString()+"_gifticon.jpg";
			ServletContext app=ses.getServletContext();
			String upDir=app.getRealPath("/resources/Gifticon");
			String rootDirectory = upDir;
			String giftCardImageFile = rootDirectory+"/"+gifticonName; // 저장될 파일 이름
			ImageIO.write(giftCardImage, "jpg", new File(giftCardImageFile));
			upDir=System.getProperty("user.dir");
        	rootDirectory = upDir+"/src/main/resources/static/upload_images/gifticon";
        	ImageIO.write(giftCardImage, "jpg", new File(giftCardImageFile));
			System.out.println("Gift card image saved as: " + giftCardImageFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
//		ServletContext app=ses.getServletContext();
//		String directory=app.getRealPath("/resources/Gificon");
//        String filePath = directory + "/"+gifticonName;
//        File outputFile = new File(filePath);
//        File dir=new File(directory);
//		if(!dir.exists()){
//			dir.mkdirs();
//		}
//        ImageIO.write(barcodeImage, "jpg", outputFile);
		
		return gifticonName;
	}
	
	public static BufferedImage barcodeGenerate(String barcodeData) {
		//바코드 이미지 생성
		BufferedImage barcodeImage = null;
		// 바코드 생성을 위한 설정
		try {
	        int width = 400; // 이미지 너비
	        int height = 100; // 이미지 높이
	        String format = "png"; // 이미지 형식

	        Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
	        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
	        
	        
	        // 바코드 생성
	        BitMatrix bitMatrix;
				bitMatrix = new MultiFormatWriter().encode(
				        barcodeData,
				        BarcodeFormat.CODE_128, // 바코드 형식 선택
				        width,
				        height,
				        hints
				);
				// BitMatrix를 BufferedImage로 변환
				barcodeImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
				for (int x = 0; x < width; x++) {
					for (int y = 0; y < height; y++) {
						barcodeImage.setRGB(x, y, bitMatrix.get(x, y) ? 0x000000 : 0xFFFFFF);
					}
				}
			} catch (WriterException e) {
				e.printStackTrace();
			}
		return barcodeImage;
	}

}
