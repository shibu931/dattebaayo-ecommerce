<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<body>

	<div class="conatiner-fliud pl-5 pr-5 p-2  ml-5 mr-5">
		<form action="fileUpload" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="exampleInputEmail1">Product Name</label> <input
					type="text" name="p_name" class="form-control" />
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
				<label for="exampleInputEmail1">Product Price</label> <input
					type="number" name="p_price" class="form-control" />
			</div>
			<div class="form-group col-md-6">
				<label for="exampleInputEmail1">Product Discounted Price</label> <input
					type="number" name="p_dis_price" class="form-control" />
			</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="inputState">Product Anime</label> <select id="anime"
						name="p_anime" class="form-control">
						<c:forEach var="animeList" items="${anime	}">
							<option value="${animeList.id}">${animeList.anime}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-4">
					<label for="inputState">Product Anime Character</label> <select
						id="anime_character" name="p_character" class="form-control">
						<option value="1001">Multiple</option>
					</select>
				</div>
				<div class="form-group col-md-4">
					<label for="inputState">Product Category</label> <select
						id="product_categorie" name="p_category" class="form-control">
						<c:forEach var="categ" items="${cat	}">
							<option value="${categ.id }">${categ.category }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="exampleFormControlFile1">Images</label> <input
					type="file" class="form-control-file" multiple name="images"
					id="exampleFormControlFile1">
			</div>

			<div class="form-group">
				<label for="exampleInputEmail1">Product Banner Image</label> <input
					type="text" class="form-control" value="banner.webp"
					name="image3" />
			</div>

			<label for="colors">Select Products Color:</label><br>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="Red"
					name="p_color[]" value="Red"> <label
					class="form-check-label" for="Red">Red</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="Green"
					name="p_color[]" value="Green"> <label
					class="form-check-label" for="Green">Green</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="Black"
					name="p_color[]" value="Black"> <label
					class="form-check-label" for="Black">Black</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="White"
					name="p_color[]" value="White"> <label
					class="form-check-label" for="White">White</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="Blue"
					name="p_color[]" value="Blue"> <label
					class="form-check-label" for="Blue">Blue</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="Grey"
					name="p_color[]" value="Grey"> <label
					class="form-check-label" for="Grey">Grey</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="Sky Blue"
					name="p_color[]" value="Sky Blue"> <label
					class="form-check-label" for="Sky Blue">Sky Blue</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="Yellow"
					name="p_color[]" value="Yellow"> <label
					class="form-check-label" for="Yellow">Yellow</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="Pink"
					name="p_color[]" value="Pink"> <label
					class="form-check-label" for="Pink">Pink</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="Brown"
					name="p_color[]" value="Brown"> <label
					class="form-check-label" for="Brown">Brown</label>
			</div>

			<br> <label class="mt-2" for="size">Select Products
				Size:</label><br>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="XXL"
					name="p_size[]" value="XXL"> <label
					class="form-check-label" for="XXL">XXL</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="XL"
					name="p_size[]" value="XL"> <label class="form-check-label"
					for="XL">Xl</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="l"
					name="p_size[]" value="L"> <label class="form-check-label"
					for="l">L</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="m"
					name="p_size[]" value="M"> <label class="form-check-label"
					for="m">M</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="s"
					name="p_size[]" value="S"> <label class="form-check-label"
					for="s">S</label>
			</div>


			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>

	<%@include file="scripts.jsp"%>
	<script>
		var characterElement = document.getElementById("anime_character");
		var selectElement = document.getElementById("anime");
		selectElement.addEventListener("change", function() {
			const animeId = selectElement.value;
			getAnimeCharacter(animeId)
		});
		async function getAnimeCharacter(animeId){
			const response = await fetch('api/getCharacter',{
				method:'POST',
				headers:{
					 'Content-type':'application/json'
				},
				body:JSON.stringify({'animeId':animeId})	
			})
			response.json().then(data=>{
				document.getElementById("anime_character").innerHTML = "";
				data.forEach(item => {
				      var optionElement = document.createElement("option");
				      optionElement.value = item.id; 
				      optionElement.text = item.charc;
				      characterElement.add(optionElement);
				    });
			}).catch(error=>{
				console.log(error)
			})
		}
	</script>
</body>
</html>