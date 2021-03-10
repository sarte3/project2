<!--  
<table class="table">
	<tbody>
		<tr>
			<th>구분</th>
			<th>음식명</th>
			<c:forEach var="i" begin="0" end="${fn:length(nut_list)-1}">
			<th>${nut_list[i]}</th>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_B1_cate}</td>
			<td>${meal_B1_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_B1[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_B2_cate}</td>
			<td>${meal_B2_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_B2[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_B3_cate}</td>
			<td>${meal_B3_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_B3[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_B4_cate}</td>
			<td>${meal_B4_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_B4[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_B5_cate}</td>
			<td>${meal_B5_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_B5[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_B6_cate}</td>
			<td>${meal_B6_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_B6[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<th>합계</th>
			<th>점심식사</th>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${Math.round((meal_B1[i]+meal_B2[i]+meal_B3[i]+meal_B4[i]+meal_B5[i]+meal_B6[i])*100)/100.0}</td>
			</c:forEach>
		</tr>
	</tbody>
</table>
<table class="table">
	<tbody>
		<tr>
			<th>구분</th>
			<th>음식명</th>
			<c:forEach var="i" begin="0" end="${fn:length(nut_list)-1}">
			<th>${nut_list[i]}</th>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_C1_cate}</td>
			<td>${meal_C1_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_C1[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_C2_cate}</td>
			<td>${meal_C2_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_C2[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_C3_cate}</td>
			<td>${meal_C3_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_C3[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_C4_cate}</td>
			<td>${meal_C4_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_C4[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_C5_cate}</td>
			<td>${meal_C5_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_C5[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_C6_cate}</td>
			<td>${meal_C6_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_C6[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<th>합계</th>
			<th>저녁식사</th>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${Math.round((meal_C1[i]+meal_C2[i]+meal_C3[i]+meal_C4[i]+meal_C5[i]+meal_C6[i])*100)/100.0}</td>
			</c:forEach>
		</tr>
	</tbody>
</table>
-->