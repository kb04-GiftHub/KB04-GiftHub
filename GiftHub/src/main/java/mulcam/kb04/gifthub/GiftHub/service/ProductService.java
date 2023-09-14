package mulcam.kb04.gifthub.GiftHub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.BuyDto;
import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;
import mulcam.kb04.gifthub.GiftHub.dto.ProductDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;

@Service
public interface ProductService {

//	public ProductDto insertProduct(MultipartFile file, String productName, int productPrice, String productMemo, String productExp);
	
	public ProductDto save(ProductDto product);

	public List<StoreDto> allStores();

	public List<Object[]> allProducts();

	public ProductDto findByProductNo(int productNo);

	public StoreDto findByStoreId(String storeId);

	public CustomerDto findByCustomerId(String customerId);

	public void payPoint(CustomerDto customer);

	public BuyDto buyProduct(BuyDto buy);

	public GiftDto createGifticon(GiftDto gift);

//	public Product getProductById(int productId);

//	public Product saveProduct(Product product);
}
