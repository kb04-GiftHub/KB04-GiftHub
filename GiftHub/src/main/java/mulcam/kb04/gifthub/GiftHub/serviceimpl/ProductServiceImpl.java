package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import mulcam.kb04.gifthub.GiftHub.dto.ProductDto;
import mulcam.kb04.gifthub.GiftHub.entity.Product;
import mulcam.kb04.gifthub.GiftHub.repository.ProductRepository;
import mulcam.kb04.gifthub.GiftHub.service.ProductService;

@Component
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository repository;

	@Override
	public ProductDto save(ProductDto productDto) {
		Product product = Product.dtoToEntity(productDto);
		Product pro = repository.save(product);
		ProductDto dto = ProductDto.entityToDto(pro);
		return dto;
	}

//	@Override
//	public Product getProductById(int productId) {
//		return repository.findById(productId).orElse(null);
//	}

//	@Override
//	public Product saveProduct(Product product) {
//		return repository.save(product);
//	} 

//	@Override
//	public ProductDto insertProduct(MultipartFile file, String productName, int productPrice, String productMemo,
//			String productExp) {
//		
//		repository.save(null);
//		return null;
//	}
	
	



}
