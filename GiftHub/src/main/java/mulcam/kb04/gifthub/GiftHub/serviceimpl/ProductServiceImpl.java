package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.ProductDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Product;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;
import mulcam.kb04.gifthub.GiftHub.repository.ProductRepository;
import mulcam.kb04.gifthub.GiftHub.repository.StoreRepository;
import mulcam.kb04.gifthub.GiftHub.service.ProductService;

@Component
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository repository;
	
	@Autowired
	private StoreRepository storeRepo;
	
	@Autowired
	private CustomerRepository customerRepo;

	@Override
	public ProductDto save(ProductDto productDto) {
		Product product = Product.dtoToEntity(productDto);
		Product pro = repository.save(product);
		ProductDto dto = ProductDto.entityToDto(pro);
		return dto;
	}

	@Override
	public List<StoreDto> allStores() {
		List<Store> listEntity = storeRepo.findAll();
		List<StoreDto> list = new ArrayList<StoreDto>();
		for(Store store : listEntity) {
			StoreDto dto = StoreDto.entityToDto(store);
			list.add(dto);
		}
		return list;
	}

	@Override
	public List<Object[]> allProducts() {
		List<Object[]> list = repository.findAllProductAndCategory();
		return list;
	}

	@Override
	public ProductDto findByProductNo(int productNo) {
		
		Product pro = repository.findByProductNo(productNo);
		ProductDto dto = ProductDto.entityToDto(pro);
		
		return dto;
	}

	@Override
	public StoreDto findByStoreId(String storeId) {
		
		Store store = storeRepo.findByStoreId(storeId);
		StoreDto dto = StoreDto.entityToDto(store);
		return dto;
		
	}

	@Override
	public CustomerDto findByCustomerId(String customerId) {
		Customer customer = customerRepo.findByCustomerId(customerId);
		CustomerDto dto = CustomerDto.entityToDto(customer);
		
		return dto;
	}

	@Override
	public void payPoint(CustomerDto customer) {
		Customer cus = Customer.dtoToEntity(customer);
		customerRepo.save(cus);
	}


	
	



}
