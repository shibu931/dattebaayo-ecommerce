package com.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.Entities.Address;
import com.Entities.Anime;
import com.Entities.Cart;
import com.Entities.Categories;
import com.service.AddressService;
import com.service.AnimeService;
import com.service.CartService;
import com.service.CategoryService;
import com.service.CharacterService;
import com.service.CouponsCodesService;
import com.service.ImageDBService;
import com.service.OrdersService;
import com.service.ProductColorService;
import com.service.ProductImageService;
import com.service.ProductService;
import com.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Entities.CouponCodes;
import com.Entities.Message;
import com.Entities.Orders;
import com.Entities.Product;
import com.Entities.ProductColor;
import com.Entities.ProductImage;
import com.Entities.ProductSize;
import com.Entities.User;
import com.helper.MailSender;
import com.helper.OtpGenerator;

@Controller
public class MainController {

	@Autowired
	ProductService productService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	AnimeService animeService;
	@Autowired
	CharacterService characterService;
	@Autowired
	ProductColorService productColorService;
	@Autowired
	ProductImageService productImageService;
	@Autowired
	UserService userService;
	@Autowired
	CartService cartService;
	@Autowired
	AddressService addressService;
	@Autowired
	OrdersService ordersService;
	@Autowired
	CouponsCodesService couponsCodesService;
	@Autowired
	ImageDBService imageDBService;
	
	
	@RequestMapping("/removeCoupon")
	public String removeCoupon(HttpServletRequest req) {
		HttpSession session = req.getSession();
		boolean flag= false;
		session.setAttribute("flag", flag);
		session.removeAttribute("coupon");
		session.removeAttribute("m1");
		return "redirect:/cart";
	}
	
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	public String createProduct(@RequestParam("p_name") String name, @RequestParam("p_price") int price,
			@RequestParam("p_dis_price") int real_price, @RequestParam("p_anime") int anime,
			@RequestParam("p_category") int cate, @RequestParam("p_character") int chara,
			@RequestParam("images") CommonsMultipartFile[] file , @RequestParam("image3") String image3,
			@RequestParam("p_color[]") String[] color, @RequestParam("p_size[]") String[] size, Model model,HttpSession s)
			throws IOException {
		List<ProductColor> colors = new ArrayList<ProductColor>();
		List<ProductSize> sizes = new ArrayList<ProductSize>();
		Product product = new Product();
		ProductImage images = new ProductImage();
		product.setP_name(name);
		product.setP_price(price);
		product.setP_dis_price(real_price);
		product.setP_anime(anime);
		product.setP_character(chara);
		product.setP_category(cate);

		for (String string : color) {
			ProductColor pcolor = new ProductColor();
			pcolor.setColor(string);
			pcolor.setProduct(product);
			colors.add(pcolor);
		}
		for (String string : size) {
			ProductSize psize = new ProductSize();
			psize.setSize(string);
			psize.setProduct(product);
			sizes.add(psize);
		}
		images.setImage(file[0].getOriginalFilename());
		images.setImage1(file[1].getOriginalFilename());
		images.setImage2(file[2].getOriginalFilename());
		for(int i=0;i<file.length;i++) {
				Path path = Paths.get("/mnt/efs/" + file[i].getOriginalFilename());
			    try {
					Files.write(path, file[i].getBytes());
				} catch (IOException e) {
					MailSender.sendMail("", "", "", e.toString());
				}
		}
		images.setImage3(image3);
		images.setProduct(product);
		product.setImages(images);
		product.setColor(colors);
		product.setSize(sizes);
		boolean status = this.productService.addProduct(product);
		model.addAttribute("status", status);
		return "redirect:/93191157459990191677";
	}
	
	@RequestMapping(value = "/uploadfile9319115745", method = RequestMethod.POST)
	public String fileUpload(@RequestParam("thisfile") CommonsMultipartFile[] files,@RequestParam("type") String type, HttpSession s, Model mod,HttpServletRequest req) {
		for (CommonsMultipartFile file : files) {
			Path path = Paths.get("/mnt/efs/" + file.getOriginalFilename());
		    try {
				Files.write(path, file.getBytes());
			} catch (IOException e) {
				MailSender.sendMail("", "", "", e.toString());
				
			}
		}
//		FileHandler handler = new FileHandler();
//		if(type.equals("thumbnail")) {
//			List<String> imageName = handler.saveThumbnail(file, s);
//			req.setAttribute("flag", 1);
//			mod.addAttribute("imgName", imageName);
//		}else {
//			for (int i = 0; i < file.length; i++) {
//				ImageDB image= new ImageDB();
//				image.setImageName(file[i].getOriginalFilename());
//				image.setImage(file[i].getBytes());
//				this.imageDBService.saveImage(image);
//			}
//			List<String> imageName = handler.saveImage(file, s);
//			req.setAttribute("flag",0);
//			mod.addAttribute("imgName", imageName);
//		}
		return "showupload";
	}

	@RequestMapping("/uploadImages9319115745")
	public String upload() {
		return "fileform";
	}

	@RequestMapping("/about")
	public String about(Model model) {
		model.addAttribute("title", "Dattebaayo.com | About Us | Dattebayo");
		return "about";
	}
	
	@RequestMapping("/privacy-policy")
	public String termsandconditions(Model model) {
		model.addAttribute("title", "Dattebayo | Privacy Policy | Dattebaayo.com");
		return "policy";
	}

	@RequestMapping("/ordersuccessfull")
	public String order(@RequestParam("status") int flag, Model model, HttpSession session, HttpServletRequest request) {
		if (flag == 1) {
			User user = (User) session.getAttribute("user");
			List<Orders> orders = this.ordersService.getOrders(user.getUser_id());
			model.addAttribute("order", orders.get(0));
			Message msg = new Message("Order Placed Successfully", "green", "success");
			request.setAttribute("msg", msg);
		} else if (flag == 0) {
			Message msg = new Message("Please Try Again", "green", "success");
			request.setAttribute("msg", msg);
		}
		model.addAttribute("title", "Dattebaayo || Orders");
		return "orderbooked";
	}

	@RequestMapping("/checkout")
	public String checkout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}
		Address address = this.addressService.getAddress(user.getUser_id());
		int cartTotal = (Integer) session.getAttribute("cartTotal");
		model.addAttribute("address", address);
		request.setAttribute("cartTotal", cartTotal);
		request.setAttribute("userId", user.getUser_id());
		model.addAttribute("user", user);
		String coupon = (String) session.getAttribute("coupon");
		if (coupon != null) {
			request.setAttribute("coupon", coupon);
		} else {
			request.setAttribute("coupon", "false");
		}
		model.addAttribute("title", "Dattebayo || Checkout");
		return "checkout";
	}

	@RequestMapping(value = "/changePass", method = RequestMethod.POST)
	public String changePass(@RequestParam("password") String password, @RequestParam("repass") String repass,
			HttpSession session, HttpServletRequest request) {
		Message msg = new Message();
		if (password.equals(repass)) {
		} else {
			msg.setContent("Password not match!");
			request.setAttribute("msg", msg);
			return "redirect:/login";
		}

		User user = (User) session.getAttribute("tempUser");
		user.setPassword(password);
		this.userService.updatePassword(user);
		session.removeAttribute("tempUser");
		return "redirect:/login";
	}

	@RequestMapping(value = "/resetPass", method = RequestMethod.POST)
	public String resetPass(@RequestParam("otp") String newOtp, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String otp = (String) session.getAttribute("otp");
		Message msg = new Message();
		if (otp.equals(newOtp)) {
		} else {
			msg.setContent("Wrong OTP!");
			request.setAttribute("msg", msg);
			return "otp";
		}
		return "changepass";
	}

	@RequestMapping("/generateOtp")
	public String sendOTP(@RequestParam("number") String phone, HttpServletRequest request) {
		User user = this.userService.findUser(phone);
		Message msg = new Message();
		if (user == null) {
			msg.setContent("Phone number not found");
			request.setAttribute("msg", msg);
			return "resetpass";
		}
		OtpGenerator otpGenerator = new OtpGenerator();
		String otp = otpGenerator.generateOtp();
		otpGenerator.sendOtp(otp, phone);
		HttpSession session = request.getSession();
		session.setAttribute("otp", otp);
		session.setAttribute("tempUser", user);
		return "otp";
	}

	@RequestMapping("/resetpass")
	public String resetpass(Model model) {
		model.addAttribute("title", "Dattebaayo || Reset Password");
		return "resetpass";
	}

	@RequestMapping(value = "/createuser", method = RequestMethod.POST)
	public String createUser(@ModelAttribute("user") User user, Model model, HttpServletRequest request) {
		String password = user.getPassword();
		System.out.println(password + " " + user.getrPassowrd());
		System.out.println(user.getNumber().length() + " " + user.getNumber());
		Message msg = new Message();
		User user2 = this.userService.findUser(user.getNumber());
		if (user2 == null) {

		} else {
			msg.setContent("Number Already Registered!!");
			msg.setCssClass("danger");
			model.addAttribute("msg", msg);
			return "register";
		}
		if (user.getNumber().length() != 10) {
			msg.setContent("Please Enter 10 Digit Phone Number");
			msg.setCssClass("danger");
			model.addAttribute("msg", msg);
			return "register";
		} else if (password.equals(user.getrPassowrd())) {
		} else {
			msg.setContent("Password Not Match");
			msg.setCssClass("danger");
			model.addAttribute("msg", msg);
			return "register";
		}
		boolean flag = this.userService.createUser(user);
		if(flag) {
			MailSender.sendMail("New User Registered", user.getEmail(), user.getName(), user.getNumber());	
		}
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		return "redirect:/AddAddress";
	}

	@RequestMapping("/applycoupon")
	public String applycoupon(@RequestParam("couponcode") String couponcode, Model model, HttpServletRequest req,HttpServletResponse resp) {
		HttpSession session = req.getSession();
		String str = couponcode.toUpperCase();
		List<CouponCodes> coupons = this.couponsCodesService.getAllCouponCodes();
		int discountPercentage =0;	
		Message m1 = new Message();
		boolean flag = false;
		m1.setCssClass("danger");
		m1.setContent("Invalid Coupon");
		User user = (User)session.getAttribute("user");
		boolean couponStatus = this.ordersService.getCouponStatus(couponcode, user.getUser_id());
		if(couponStatus) {
			for (CouponCodes couponCodes : coupons) {
				if (str.equals(couponCodes.getCoupon())) {
					flag = true;
					m1.setContent(couponcode + " Applied");
					session.setAttribute("coupon", couponcode);
					m1.setCssClass("info");
					discountPercentage =  couponCodes.getDiscountPercentage();
					break;
				}
			}
		}else {
			m1.setContent("Coupon already applied");
		}
		System.out.println(discountPercentage);
		session.setAttribute("discountPercentage", discountPercentage);
		session.setAttribute("m1", m1);
		session.setAttribute("flag", flag);
		return "redirect:/cart";
	}

	@RequestMapping("/removeProductFromCart/{cartId}")
	public String removeProductFromCart(@PathVariable("cartId") int cartId) {
		this.cartService.deleteProductFromCart(cartId);
		return "redirect:/cart";
	}

	@PostMapping("/changePassword")
	public String changePassword(@RequestParam("oldpassword") String oldpassword,
			@RequestParam("newpassword") String newpassword, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String p = user.getPassword();
		if (p.equals(oldpassword)) {
			user.setPassword(newpassword);
			this.userService.updatePassword(user);
		} else {
			Message message = new Message("Password Not Match", "", "");
			request.setAttribute("mx1", message);
		}
		return "redirect:/profile";
	}

	@PostMapping("/updateAddress")
	public String updateAddress(@ModelAttribute("address") Address address, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		address.setUser_id(user.getUser_id());
		Address oldAddress = (Address) session.getAttribute("address");
		address.setAddress_id(oldAddress.getAddress_id());
		this.addressService.updateAddress(address);
		return "redirect:/profile";
	}

	@PostMapping("/saveAddress")
	public String saveAddress(@ModelAttribute("address") Address address, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}
		address.setUser_id(user.getUser_id());
		session.setAttribute("address", address);
		this.addressService.saveAddress(address);
		return "redirect:/";
	}

	@RequestMapping("/AddAddress")
	public String addAddress(Model model) {
		model.addAttribute("title", "Dattebayo || Add Address");
		return "AddAddress";
	}

	@RequestMapping("/profile")
	public String profile(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Address address = (Address) session.getAttribute("address");
		if (user == null) {
			return "redirect:/login";
		}
		List<Orders> orders = this.ordersService.getOrders(user.getUser_id());
		if (orders == null) {
			Message msg = new Message("You don't have any orders", null, "danger");
			request.setAttribute("msg", msg);
		} else {
			Product products = new Product();
			Map<Orders, Product> map = new HashMap<Orders, Product>();
			for (Orders o : orders) {
				products = this.productService.getProductById(o.getProduct_id());
				map.put(o, products);
			}
			session.setAttribute("orders", map);
		}
		model.addAttribute("user", user);
		model.addAttribute("address", address);
		model.addAttribute("title", "Dattebayo || Profile");
		return "profile";
	}

	@RequestMapping(value = "/addtocart", method = RequestMethod.POST)
	public String addToCart(@RequestParam("size") String size, @RequestParam("color") String color,
			@RequestParam("quantity") String quantity, @RequestParam("product_id") String p_id, Model model,
			HttpServletRequest req) {
		int q = Integer.parseInt(quantity);
		int a = Integer.parseInt(p_id);
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			Cart cart = new Cart();
			cart.setProduct_id(a);
			cart.setSize(size);
			cart.setColor(color);
			cart.setUser_id(user.getUser_id());
			cart.setQuantity(q);
			this.cartService.addToCart(cart);
		}
		return "redirect:/cart";
	}

	@RequestMapping("/authenticate")
	public String authenticate(@RequestParam("number") String number, @RequestParam("password") String password,
			Model model, HttpServletRequest req) {
		User user = this.userService.findUser(number);
		HttpSession s = req.getSession();
		if (user == null) {
			Message msg = new Message("Username Not Found", "Error", "danger");
			model.addAttribute("msg", msg);
			return "login";
		} else if (user.getPassword().equals(password)) {
			int user_id = user.getUser_id();
			Address address = this.addressService.getAddress(user_id);
			s.setAttribute("user", user);
			s.setAttribute("address", address);
		} else {
			Message msg = new Message("Password Not Match", "Error", "danger");
			model.addAttribute("msg", msg);
			return "login";
		}
		
		return "redirect:/";
	}

	@RequestMapping("/")
	public String slash(Model model) {
		List<Product> latestProducts = this.productService.getLatestProducts();
		model.addAttribute("products", latestProducts);
		List<Product> topSellingProducts = this.productService.getTopSellingProducts();
		model.addAttribute("topSellingProducts", topSellingProducts);
		model.addAttribute("title", "Buy Anime Merchandise Online - Best Deals & Free Shipping | Dattebaayo.com | Dattebayo");
		return "index";
	}

	@RequestMapping("/index")
	public String index() {
		return "redirect:/";
	}

	@RequestMapping("/home")
	public String home() {
		return "redirect:/";
	}

	@RequestMapping("/93191157459990191677")
	public String addProducts(Model model) {
		List<Categories> list = this.categoryService.getAllCategories();
		List<Anime> animeList = this.animeService.getAllAnime();
		model.addAttribute("cat", list);
		model.addAttribute("anime", animeList);
		return "add-product";
	}

	

	@RequestMapping("/shop")
	public String search(@RequestParam("keyword") String keyword,
			@RequestParam(value = "page", defaultValue = "0") int page,@RequestParam(value = "sortBy",defaultValue = "") String sortBy, Model model, HttpServletRequest request) {
		if(page!=0)page=page-1;	
		List<Product> products = new ArrayList<Product>();
		List<Integer> totalPage = new ArrayList<Integer>();
		Message msg = new Message();
		int rowCount = this.productService.getSearchedProductRowCount(keyword);
		if (rowCount == 0) {
			msg.setContent("Nothing found matching your query!");
			msg.setCssClass("danger");
		} else {
			products = this.productService.getSearchedProduct(keyword, page, sortBy);
			int pageCount = (int) Math.ceil(rowCount / 8);
			System.out.println(pageCount);
			for (int i = 0; i <= pageCount; i++) {
				totalPage.add(i + 1);
			}
			msg.setContent("Showing results of: " + keyword);
			msg.setCssClass("success");
		}
		if(sortBy.equals("")) {
			model.addAttribute("link", "shop?keyword="+keyword+"&");
		}else {
			model.addAttribute("link", "shop?keyword="+keyword+"&sortBy="+sortBy+"&");
		}
		request.setAttribute("keyword", keyword);
		request.setAttribute("msg", msg);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("products", products);
		model.addAttribute("title", "Explore "+keyword+" Products | Anime Products From Nartuo to Demon Slayer  | Shop | Dattebaayo.com | Dattebayo");
		return "shop";
	}

	@RequestMapping("/shop/{catId}")
	public String explore(@PathVariable(value = "catId", required = false) int id,
			@RequestParam(value = "page", defaultValue = "0") int page,@RequestParam(value = "sortBy",defaultValue = "") String sortBy, Model model, HttpServletRequest request) {
		if(page!=0)page=page-1;
		List<Product> products = new ArrayList<Product>();
		String titleName ="";
		int rowCount = 0;
		if (id > 0 && id < 100) {
			rowCount = this.productService.getRowCount("p_anime", id);
			products = this.productService.getProductByAnime(id, page, sortBy);
			Anime anime = this.animeService.getanimeById(id);
			titleName = anime.getAnime();
		} else if (id > 100 && id < 200) {
			rowCount = this.productService.getRowCount("p_category", id);
			products = this.productService.getProductsByCategory(id, page, sortBy);
			Categories category= this.categoryService.getCategoryById(id);
			titleName = category.getCategory();
		}
		int pageCount = (int) Math.ceil(rowCount / 8);
		List<Integer> totalPage = new ArrayList<Integer>();
		for (int i = 0; i <= pageCount; i++) {
			totalPage.add(i + 1);
		}
		if(sortBy.equals("")) {
			model.addAttribute("link", "shop/"+id+"?");
		}else {
			model.addAttribute("link", "shop/"+id+"?sortBy="+sortBy+"&");
		}
		model.addAttribute("type", id);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("products", products);
		model.addAttribute("title", "Explore "+titleName+" Products | Shop | Dattebaayo.com | Dattebayo");
		return "shop";
	}

	@RequestMapping("/cart")
	public String cart(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		float subTotal = 0;
		List<Cart> cart = null;
		HashMap<Cart, Product> map = new HashMap<Cart, Product>();
		if (user == null) {
			return "login";
		} else {
			cart = this.cartService.getCartObj(user.getUser_id());
		}
		if (cart.size() == 0) {
			Message msg = new Message("Your cart is empty", "Null", "info");
			model.addAttribute("msg", msg);
		} else {
			for (Cart cart2 : cart) {
				Product p = this.productService.getProductById(cart2.getProduct_id());
				subTotal += p.getP_dis_price();
				map.put(cart2, p);
			}
			req.setAttribute("cartitems", map);
		}
		model.addAttribute("subTotal", subTotal);
		model.addAttribute("title", "Dattebayo || Cart");
		return "cart";
	}

	@RequestMapping("/contact")
	public String contact(Model model) {
		model.addAttribute("title", "Dattebayo || Contact");
		return "contact";
	}

	@RequestMapping("/details/{productId}/{productName}")
	public String details(@PathVariable("productId") int pId,@PathVariable("productName") String productName, Model model, HttpServletRequest request) {
		Product product = this.productService.getProductByName(productName,pId);
		ProductImage images = product.getImages();
		List<Product> similarProducts = this.productService.getProductByAnime(product.getP_anime(), 0,"");
//		request.setAttribute("productCategory", product.getP_category());
		model.addAttribute("productCategory",product.getP_category());
		model.addAttribute("similarProducts", similarProducts);
		model.addAttribute("images", images);
		model.addAttribute("product", product);
		model.addAttribute("title", product.getP_name()+" | Dattebaayo.com | Dattebayo");
		return "detail";
	}

	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("title", "Dattebayo || login");
		return "login";
	}

	@RequestMapping("/register")
	public String register(Model model) {
		model.addAttribute("title", "Dattebayo || Signup");
		return "register";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession s = req.getSession();
		s.removeAttribute("user");
		return "redirect:/login";
	}
	
	@RequestMapping("/profile-details")
	public String pdeatil() {
		return "profile-detail";
	}


}
