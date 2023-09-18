package mulcam.kb04.gifthub.GiftHub.message;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class SmsResultService {
//	@Value("${naver-cloud-sms.accessKey}")
	private String accessKey="YLjgzu3LhhDEYvlqwHUF";
	
//	@Value("${naver-cloud-sms.secretKey}")
	private String secretKey="Pb6ABDJaFDplLBOUwzQLZopn00JwVbHMx2HBMAoe";
	
//	@Value("${naver-cloud-sms.serviceId}")
	private String serviceId="ncp:sms:kr:316034942420:gifthub_test";
 
//	@Value("${naver-cloud-sms.senderPhone}")
	private String phone="01034803259";
	
	
	public String makeSignature(Long time) throws NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeyException {
		String space = " ";
        String newLine = "\n";
        String method = "GET";
        String url = "/sms/v2/services/"+ this.serviceId+"/messages";
        String timestamp = time.toString();
        String accessKey = this.accessKey;
        String secretKey = this.secretKey;
 
        String message = new StringBuilder()
                .append(method)
                .append(space)
                .append(url)
                .append(newLine)
                .append(timestamp)
                .append(newLine)
                .append(accessKey)
                .toString();
 
        SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(signingKey);
 
        byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
        String encodeBase64String = Base64.encodeBase64String(rawHmac);
 
        return encodeBase64String;
	}
	
	public SmsResultDto sendSms(String requestId) throws RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, IOException {
		Long time = System.currentTimeMillis();
		
		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("x-ncp-apigw-timestamp", time.toString());
		headers.set("x-ncp-iam-access-key", accessKey);
		headers.set("x-ncp-apigw-signature-v2", makeSignature(time));
		HttpEntity<String> http = new HttpEntity<>(headers);
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Object> responseEntity =
				restTemplate.exchange(
						new URI("https://sens.apigw.ntruss.com/sms/v2/services/"+this.serviceId+"/messages?requestId="+requestId)
						,HttpMethod.GET,
						http,
						Object.class);
	    System.out.println(responseEntity.getBody());
	    return null;	
	}
	
}
