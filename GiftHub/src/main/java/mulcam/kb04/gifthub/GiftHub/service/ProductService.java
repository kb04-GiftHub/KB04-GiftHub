package mulcam.kb04.gifthub.GiftHub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import mulcam.kb04.gifthub.GiftHub.dto.ProductDto;
import mulcam.kb04.gifthub.GiftHub.entity.Product;
import mulcam.kb04.gifthub.GiftHub.repository.ProductRepository;

@Service
public interface ProductService {

//	public ProductDto insertProduct(MultipartFile file, String productName, int productPrice, String productMemo, String productExp);
	
	public Product save(ProductDto product);
}
