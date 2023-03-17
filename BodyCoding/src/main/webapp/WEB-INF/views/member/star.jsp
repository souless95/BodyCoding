<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#star_rates fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#star_rates fieldset legend{
    text-align: right;
}
#star_rates input[type=radio]{
    display: none;
}
#star_rates label{
    font-size: 2.5em;
    color: transparent;
    text-shadow: 0 0 0 #dee0df;
}
#star_rates label:hover{
    text-shadow: 0 0 0 #ffea00;
}
#star_rates label:hover ~ label{
    text-shadow: 0 0 0 #ffea00;
}
#star_rates input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #ffea00;
}

input[type=number]{
    margin-bottom: 0;
    margin-left: 8px;
    padding: 6px 8px;
    font-size: 1em;
    border: none;
    border-radius: 4px;
}
.rating-wrap{
    padding: 10px;
    display: flex;
}
.rating {
    display: flex;
    align-items: center;
    position: relative;
}
.star {
    width: 30px;
    height: 30px;
    margin-right: 2px;
}
.starcolor{
    fill: #ffea00;
}
.star:last-of-type {
    margin-right: 0;
}
.overlay{
    background-color: #000;
    opacity: 0.5;
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    z-index: 1;
    transition: all 0.3s ease-in-out;
}
@supports (mix-blend-mode: color) {
    .overlay{
        mix-blend-mode: color;
        opacity: unset;
    }
}
</style>
<script type="text/javascript">
const starSize = 30, maxStar = 5, gutter = 2;
let maskMax = 0;
window.onload = ()=> {
	  
	  const ratings = document.querySelectorAll('.rating');
	  
	  for (let i = 0; i < ratings.length; i++) {
	    const rating = ratings[i];
	    
	    for (let j = 0; j < maxStar; j++) {
	      let el = document.createElement('div');
	      el.style.width = starSize + 'px';
	      el.style.height = starSize + 'px';
	      el.style.marginRight = gutter + 'px';
	      el.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="none" class="starcolor" d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"/></svg>';
	      rating.appendChild(el);
	    }
	  }

	  const rateValueFields = document.querySelectorAll('input[name=ratevalue]');

	  for (let i = 0; i < rateValueFields.length; i++) {
	    maskMax = parseInt(starSize * maxStar + gutter * (maxStar - 1));
	    const field = rateValueFields[i];
	    field.max = maxStar; 
	    setRating(field.value);
	  }
	  
	  const rateValueField1 = document.querySelector('input[name=ratevalue1]');
	  const avgGrade = rateValueField1.value;
	  setTotal(avgGrade);

	  function setRating(val = 0) {
		  const rows = document.querySelectorAll('tr');
		  rows.forEach((row) => {
		    const overlays = row.querySelectorAll('.overlay');
		    const rateValueField = row.querySelector('input[name=ratevalue][value="'+val+'"]');
		    
		    if (rateValueField) {
		      overlays.forEach((overlay) => {
		      overlay.style.width = parseInt(maskMax - rateValueField.value * starSize - Math.floor(rateValueField.value) * gutter) + 'px';
		      });
		    }
		  });
	  }
	  
	  function setTotal(val = 0) {
		  const overlay = document.querySelector('.overlay');
		  const totalValueField = document.querySelector('input[name=ratevalue1][type=hidden]');

		  if (totalValueField.value === val) {
		    overlay.style.width = parseInt(maskMax - val * starSize - Math.floor(val) * gutter) + 'px';
		  }
		}
}
</script>
