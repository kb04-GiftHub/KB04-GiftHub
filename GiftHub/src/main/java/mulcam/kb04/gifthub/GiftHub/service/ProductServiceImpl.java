package mulcam.kb04.gifthub.GiftHub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import mulcam.kb04.gifthub.GiftHub.dto.ProductDto;
import mulcam.kb04.gifthub.GiftHub.entity.Product;
import mulcam.kb04.gifthub.GiftHub.repository.ProductRepository;

@Component
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository repository;

	@Override
	public Product save(ProductDto productDto) {
		Product product = Product.dtoToEntity(productDto);
		repository.save(product);
		
		return null;
	} 

//	@Override
//	public ProductDto insertProduct(MultipartFile file, String productName, int productPrice, String productMemo,
//			String productExp) {
//		
//		repository.save(null);
//		return null;
//	}
	
	



}
