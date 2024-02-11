package com.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.Entities.Cart;
import com.Entities.Character;
import com.Entities.Orders;
import com.helper.MailSender;
import com.phonepe.sdk.pg.Env;
import com.phonepe.sdk.pg.common.http.PhonePeResponse;
import com.phonepe.sdk.pg.payments.PhonePePaymentClient;
import com.phonepe.sdk.pg.payments.models.requestV1.PgPayRequest;
import com.phonepe.sdk.pg.payments.models.responseV1.PayPageInstrumentResponse;
import com.phonepe.sdk.pg.payments.models.responseV1.PgPayResponse;
import com.service.CartService;
import com.service.CharacterService;
import com.service.ImageDBService;
import com.service.OrdersService;
import com.service.ProductService;
import com.service.UserService;


@RestController
@RequestMapping("/api")
public class ApiController {

	@Autowired
	UserService userService;
	@Autowired
	CartService cartService;
	@Autowired
	OrdersService ordersService;
	@Autowired
	CharacterService characterService;
	@Autowired
	ProductService productService;
	@Autowired
	ImageDBService imageDBService;
	
	@PostMapping("/initiatepy")
	@ResponseBody
	public String initiatePayment(@RequestBody Map<String, Object> data) throws JSONException {
		System.out.println("Running");
		String merchantId = "DATTEONLINE";
		String saltKey = "85456f27-cab1-45e5-a118-6d1c8bbc6528";
		Integer saltIndex = 1;
		Env env = Env.PROD;
		boolean shouldPublishEvents = false;
		PhonePePaymentClient phonepeClient = new PhonePePaymentClient(merchantId, saltKey, saltIndex, env, shouldPublishEvents);

		String merchantTransactionId = UUID.randomUUID().toString();
		long amount = Integer.parseInt(data.get("amount").toString())*100;
		String callbackurl = "www.dattebaayo.com";
		String merchantUserId = "DATTEONLINE";

		PgPayRequest pgPayRequest = PgPayRequest.PayPagePayRequestBuilder()
		        .amount(amount)
		        .merchantId(merchantId)
		        .merchantTransactionId(merchantTransactionId)
		        .callbackUrl(callbackurl)
		        .merchantUserId(merchantUserId)
		        .build();

		PhonePeResponse<PgPayResponse> payResponse = phonepeClient.pay(pgPayRequest);
		PayPageInstrumentResponse payPageInstrumentResponse = (PayPageInstrumentResponse) payResponse.getData().getInstrumentResponse();
		String url = payPageInstrumentResponse.getRedirectInfo().getUrl();
		JSONObject object = new JSONObject();
		object.put("redirect_Url", url);
		return object.toString();
	}
	
//	@PostMapping("/create_order")
//	@ResponseBody
//	public String createOrder(@RequestBody Map<String, Object> data) throws RazorpayException, JSONException {
//		int amount = Integer.parseInt(data.get("amount").toString());
//		RazorpayClient client = new RazorpayClient("rzp_test_1mgUWTIOZWBctk","1WTZCAGeHInd5B0bq4eyKeeA"); 
//		JSONObject object = new JSONObject();
//		object.put("amount", amount*100);
//		object.put("currency", "INR");
//		object.put("receipt", "tx_931911");
//		Order order = client.Orders.create(object);
//		return order.toString();
//	}
	
	@PostMapping("/save_order")
	@ResponseBody
	public String saveOrder(@RequestBody Map<String, Object> data) throws JSONException {
			JSONObject object = new JSONObject();
			int userId = Integer.parseInt(data.get("userId").toString());
			String name =(String) data.get("name");
			String email = (String) data.get("email") ; 
			String number = (String) data.get("number") ; 
			String houseNo = (String) data.get("houseNo") ; 
			String streetNo = (String) data.get("streetNo") ; 
			String locality = (String) data.get("locality") ; 
			String city = (String) data.get("city") ; 
			String state = (String) data.get("state") ; 
			String pincode = (String) data.get("pincode") ; 
			String paymentMode = (String) data.get("paymentMode");
			String coupon = (String) data.get("coupon");
			System.out.println(coupon);
			Random random = new Random();
			int a = random.nextInt(100000);
			String orderId = "ODR"+a;
			List<Cart> cart = this.cartService.getCartObj(userId);
			for (Cart cart2 : cart) {
				Orders order = new Orders();
				order.setOrderId(orderId);
				order.setUser_id(userId);
				order.setName(name);
				order.setEmail(email);
				order.setNumber(number);
				order.setHouseNo(houseNo);
				order.setStreetNo(streetNo);
				order.setLocality(locality);
				order.setCity(city);
				order.setState(state);
				order.setStatus("In Progress");
				order.setPincode(pincode);
				order.setPaymentMode(paymentMode);
				order.setCoupon(coupon);
				System.out.println(cart2.getProduct_id());
				order.setProduct_id(cart2.getProduct_id());
				order.setColor(cart2.getColor());
				order.setSize(cart2.getSize());
				order.setQuantity(cart2.getQuantity());
				this.ordersService.createOrder(order);
			}	
			object.put("status", 1);
			object.put("orderId", orderId);
			this.cartService.deleteProductFromCartusingUserId(userId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("from", "Dattebaayo Server");
			map.put("name", "New Order");
			map.put("subject", orderId);
			map.put("message", number);
			sendMail(map);
		return object.toString();
	}
	
	@PostMapping("/getCharacter")
	@ResponseBody
	public List<Character> getAnimeChar(@RequestBody
			Map<String, Object> data) {
		 int animeId = Integer.parseInt(data.get("animeId").toString());
		return this.characterService.getAnimeCharacter(animeId);
		 
	}
	
	
	@PostMapping("/sendmail")
	public ResponseEntity<String> sendMail(@RequestBody Map<String,String> data) {
		String from = data.get("email");
		String name = data.get("name");
		String subject = data.get("subject");
		String msg = data.get("message");
		MailSender.sendMail(subject, name, from, msg);
		 
	      return new ResponseEntity<String>("Response body", HttpStatus.OK);
	}
	
	@PostMapping("/returnOrder")
	@ResponseBody
	public String returnOrder(@RequestBody Map<String, Object> data) throws JSONException {
		String orderId= data.get("orderId").toString();
		System.out.println(orderId);
		Map<String, String> map = new HashMap<String, String>();
		map.put("from", "Dattebaayo Server");
		map.put("name", "Return Order Order");
		map.put("subject", orderId);
		map.put("message", "Return Order: "+orderId);
		sendMail(map);
		JSONObject object = new JSONObject();
		object.put("Status", 1);
		return object.toString();
	}
	
	@GetMapping("/images/{filename:.+}")
	public ResponseEntity<byte[]> getImage(@PathVariable String filename) {
	    try {
	        Path path = Paths.get("/mnt/efs/" + filename);
	        byte[] imageBytes = Files.readAllBytes(path);
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.IMAGE_JPEG);
	        return new ResponseEntity<byte[]>(imageBytes, headers, HttpStatus.OK);
	    } catch (IOException e) {
	        return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
	    }
	}
	


	
}
