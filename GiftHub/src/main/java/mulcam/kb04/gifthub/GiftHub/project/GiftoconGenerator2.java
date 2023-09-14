package mulcam.kb04.gifthub.GiftHub.project;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;

public class GiftoconGenerator2 {
	
	private static String productImageFile;
	private static String productDescription;
	private static String barcodeImageFile;
	private static String expirationDate;
	
	
	public static void createGiftCard(HttpSession ses) {
		int width = 460; // 이미지 너비
	    int height = 700; // 이미지 높이
        ServletContext app=ses.getServletContext();
		
        productImageFile = "2022-11-16.jpg";
        barcodeImageFile = "barcode.png";
        productDescription = "이 기프티콘은 특별한 선물입니다.ddddddddddd\n 맛있는 도넛을 친구나 가족처럼 \n 소중한 사람에게 선물하세요";//30번째 마다 한번씩 나누기 7번째줄까지
        expirationDate = "유효 기간: 2023-12-31 까지";
        String productTitle = " 맛있는 도넛";
        
        BufferedImage giftCardImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = giftCardImage.createGraphics();
        
        // 배경 색상 설정
        g2d.setColor(Color.WHITE);
        g2d.fillRect(0, 0, width, height);
        
        //로고 이미지 그리기
        try {
        	String rootDirectory=app.getRealPath("/resources/Gificon");
        	String productImagePath = rootDirectory+"/"+"logo.png";
            BufferedImage logoImage = ImageIO.read(new File(productImagePath));
            g2d.drawImage(logoImage, 150, 10, 160, 40, null);
        } catch (IOException e) {
            e.printStackTrace();
        }
        
     // 상품 이미지 그리기
        try {
        	String rootDirectory=app.getRealPath("/resources/User_Image");
        	String productImagePath = rootDirectory+"/"+productImageFile;
            BufferedImage productImage = ImageIO.read(new File(productImagePath));
            g2d.drawImage(productImage, 100, 60, 260, 260, null);
        } catch (IOException e) {
            e.printStackTrace();
        }
        
     // 바코드 이미지 그리기
        try {
        	String rootDirectory=app.getRealPath("/resources/Gificon");
            String barcodeImagePath = rootDirectory + "/" + barcodeImageFile;
            BufferedImage barcodeImage = ImageIO.read(new File(barcodeImagePath));

            int barcodeWidth = 407;
            int barcodeHeight = 90;
            int barcodeX = 20;
            int barcodeY = 340;

            // 바코드 이미지 크기를 맞추기 위해 스케일 조정
            BufferedImage scaledBarcodeImage = new BufferedImage(barcodeWidth, barcodeHeight, BufferedImage.TYPE_INT_RGB);
            Graphics2D barcodeGraphics = scaledBarcodeImage.createGraphics();
            barcodeGraphics.drawImage(barcodeImage, 0, 0, barcodeWidth, barcodeHeight, null);
            barcodeGraphics.dispose();

            // 바코드 그리기
            g2d.drawImage(scaledBarcodeImage, barcodeX, barcodeY, null);

            // 바코드 중앙 위치 계산
            int barcodeCenterX = barcodeX + barcodeWidth / 2;

            // 유효 기간 텍스트 그리기 (가운데 정렬)
            g2d.setColor(Color.BLACK); // 테두리의 색상 설정
            g2d.setFont(new Font("맑은 고딕",Font.PLAIN, 12));
            FontMetrics fontMetrics = g2d.getFontMetrics();
            int expirationDateWidth = fontMetrics.stringWidth(expirationDate);
            int expirationDateX = barcodeCenterX - (expirationDateWidth / 2);
            int expirationDateY = barcodeY + barcodeHeight + 20; // 바코드 아래에 위치
            g2d.drawString(expirationDate, expirationDateX, expirationDateY);

        } catch (IOException e) {
            e.printStackTrace();
        }
        
        //바코드로 번호 불러오기
		/*
		 * Map<DecodeHintType, Object> hints = new HashMap<>();
		 * hints.put(DecodeHintType.TRY_HARDER, Boolean.TRUE);
		 * 
		 * String rootDirectory=app.getRealPath("/resources/Gificon"); String
		 * barcodeImagePath = rootDirectory + "/" + barcodeImageFile; BufferedImage
		 * image1 = ImageIO.read(new File(barcodeImagePath));
		 * 
		 * BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(new
		 * BufferedImageLuminanceSource(image1))); Result result = new
		 * MultiFormatReader().decode(binaryBitmap, hints);
		 * 
		 * String giftNo = result.getText();
		 */
        ///////////////////////////////////////////////////////////////////
        
        // 상품명을 가운데 정렬하기 위해 필요한 값들 계산
        Font font = new Font("맑은 고딕", Font.BOLD, 20);
        FontMetrics metrics = g2d.getFontMetrics(font);
        int stringWidth = metrics.stringWidth(productTitle);
        int xCoordinate = (350 - stringWidth) / 2 + 50; // 텍스트 박스의 가운데로 정렬

        g2d.setColor(Color.BLACK);
        g2d.setFont(font);

        g2d.drawString(productTitle, xCoordinate, 480);
        
     // 상품 설명 가운데 정렬
        g2d.setColor(Color.BLACK); // 테두리의 색상 설정
        g2d.drawRoundRect(50, 500, 350, 150, 20, 20);

        // 상품 설명 그리기
        int x = 60; // 텍스트의 시작 x 좌표
        int y = 520; // 텍스트의 시작 y 좌표
        int maxWidth = 330; // 텍스트 상자의 최대 너비

        g2d.setColor(Color.BLACK);
        g2d.setFont(new Font("맑은 고딕", Font.BOLD, 14));

        metrics = g2d.getFontMetrics();
        String[] descriptionLines = productDescription.split("\n"); // '\n'을 기준으로 텍스트를 나눕니다.

        for (String line : descriptionLines) {
            // 현재 줄의 길이 계산
            int lineWidth = metrics.stringWidth(line);
            
            if (lineWidth > maxWidth) {
                // 현재 줄이 최대 너비를 초과하는 경우 줄바꿈
                int startIndex = 0;
                while (startIndex < line.length()) {
                    int endIndex = startIndex + 1;
                    while (endIndex < line.length() && metrics.stringWidth(line.substring(startIndex, endIndex + 1)) <= maxWidth) {
                        endIndex++;
                    }
                    String subLine = line.substring(startIndex, endIndex);
                    g2d.drawString(subLine, x, y);
                    y += metrics.getHeight(); // 다음 줄로 이동
                    startIndex = endIndex;
                }
            } else {
                // 현재 줄이 최대 너비를 초과하지 않으면 그대로 그림
                g2d.drawString(line, x, y);
                y += metrics.getHeight(); // 다음 줄로 이동
            }
        }
        
        
        // 그래픽 컨텍스트 종료
        g2d.dispose();
        
		try {
			UUID uuid = UUID.randomUUID();
			String rootDirectory=app.getRealPath("/resources/Gificon");
			String giftCardImageFile = rootDirectory+"/"+uuid.toString() + "_gift_card.png"; // 저장될 파일 이름
			ImageIO.write(giftCardImage, "png", new File(giftCardImageFile));
			System.out.println("Gift card image saved as: " + giftCardImageFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
