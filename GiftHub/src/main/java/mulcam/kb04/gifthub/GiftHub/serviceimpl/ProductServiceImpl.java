package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mulcam.kb04.gifthub.GiftHub.dto.BuyDto;
import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;
import mulcam.kb04.gifthub.GiftHub.dto.GiftUsedDto;
import mulcam.kb04.gifthub.GiftHub.dto.JjimDto;
import mulcam.kb04.gifthub.GiftHub.dto.ProductDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.entity.Buy;
import mulcam.kb04.gifthub.GiftHub.entity.Category;
import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Gift;
import mulcam.kb04.gifthub.GiftHub.entity.Jjim;
import mulcam.kb04.gifthub.GiftHub.entity.Product;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.BuyRepository;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;
import mulcam.kb04.gifthub.GiftHub.repository.GiftRepository;
import mulcam.kb04.gifthub.GiftHub.repository.JjimRepository;
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
	
	@Autowired
	private BuyRepository buyRepo;
	
	@Autowired
	private GiftRepository giftRepo;
	
	@Autowired
	private JjimRepository jjimRepo;
	
	
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
	public List<ProductDto> findByStoreIdToList(String id) {
		
		Store store = new Store();
		store.setStoreId(id);

		List<Product> listEntity = repository.findByStoreId(store);
		List<ProductDto> myList = new ArrayList<ProductDto>();
		
		for(Product product : listEntity) {
			ProductDto dto = ProductDto.entityToDto(product);
			myList.add(dto);
		}
		
		
		return myList;
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
		if(customer != null) {
			CustomerDto dto = CustomerDto.entityToDto(customer);
			return dto;
		}else {
			return null;
		}
	}

	@Override
	public void payPoint(CustomerDto customer) {
		Customer cus = Customer.dtoToEntity(customer);
		customerRepo.save(cus);
	}

	@Override
	public BuyDto buyProduct(BuyDto buy) {
		Buy buyEntity = Buy.dtoToEntity(buy);
		buyEntity = buyRepo.save(buyEntity);
		buy = BuyDto.entityToDto(buyEntity);
		return buy;
	}

	@Override
	public GiftDto createGifticon(GiftDto gift) {
		Gift giftEntity = Gift.dtoToEntity(gift);
		giftEntity = giftRepo.save(giftEntity);
		gift = GiftDto.entityToDto(giftEntity);
		
		return gift;
	}

	@Override
	public JjimDto jjimSave(JjimDto jdto) {
		
		Jjim jjim = Jjim.dtoToEntity(jdto);
		jjim=jjimRepo.save(jjim);
		jdto=JjimDto.entityToDto(jjim);
		return jdto;
	}
	
	@Override
	public void deleteByProductNo(int productNo) {
		
		 Optional<Product> productOptional = repository.findById(productNo);
		    
		    if (productOptional.isPresent()) {
		        Product product = productOptional.get();
		        
		        // Product의 status를 0로 변경
		        product.setStatus(1);
		        
		        // 변경 내용 저장
		        repository.save(product);
		    }
	}
	
	@Override
	public JjimDto findByProductNoCustomerId(int productNo, String customerId) {
		Product product = repository.findByProductNo(productNo);
		Customer customer = customerRepo.findByCustomerId(customerId);
		Jjim jjim = jjimRepo.findByProductNoAndCustomerId(product, customer);
		if(jjim == null) {
			return null;
		}
		JjimDto jdto = JjimDto.entityToDto(jjim);
		
		return jdto;
	}

	@Override
	public boolean checkJjim(int jjimNo) {
		Jjim jjim = jjimRepo.findByJjimNo(jjimNo);
		if(jjim == null) {
			return false;
		}
		return true;
	}

	@Override
	public JjimDto findByJjimNo(int jjimNo) {
		Jjim jjim = jjimRepo.findByJjimNo(jjimNo);
		JjimDto jdto = JjimDto.entityToDto(jjim);
		return jdto;
	}

	@Override
	public List<StoreDto> allStoresByCategoryNo(int categoryNum) {
		Category cat = new Category();
		cat.setCategoryNo(categoryNum);
		List<Store> storeList = storeRepo.findAll();
		if(storeList==null) {
			return null;
		}
		List<StoreDto> dtoList	= new ArrayList<>();
		for(Store store : storeList) {
			StoreDto dto = StoreDto.entityToDto(store);
			if(dto.getCategoryNo()==categoryNum) {
				dtoList.add(dto);
			}
		}
		return dtoList;
	}

	@Override
	public List<StoreDto> findStores(String storeName) {
		List<Store> storeList = storeRepo.findByStoreName(storeName);
		List<StoreDto> dtoList	= new ArrayList<>();
		if(storeList==null) {
			return null;
		}
		for(Store store : storeList) {
			StoreDto dto = StoreDto.entityToDto(store);
			dtoList.add(dto);
		}
		return dtoList;
	}

	@Override
	public List<JjimDto> getJjimByCustomerId(String customerId) {
		List<Jjim> jjimList = jjimRepo.findByCustomer(customerId);
		List<JjimDto> dList = new ArrayList<>();
		if(jjimList == null) {
			return null;
		}
		for(Jjim jjim : jjimList) {
			JjimDto jdto = JjimDto.entityToDto(jjim);
			dList.add(jdto);
		}
		return dList;
	}
}
