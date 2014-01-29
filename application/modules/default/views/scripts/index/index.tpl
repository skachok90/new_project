<div class="select">
	<select id="country">
		<option value="0">--Выберите страну из списка--</option>
		<?php foreach ($this->countries as $value) {?>
			<option value="<?php echo $value['id']?>"><?php echo $value['value']?></option>
		<?php }?>
	</select>
	<select id="city" disabled="disabled">
		<option value="0">--Список пуст--</option>
	</select>
</div>

<script type="text/javascript">
$('#country').on('change', function(){
	if ($(this).find(':selected').prop('value') != 0) {
		$.post("", {
			"country_id": $(this).find(':selected').prop('value')
			},function(data){
				if (data) {
					$('#city').attr('disabled', false);
					$('#city option').detach();
					$('#city').append("<option value=\"0\">--Выберите город из списка--</option>");
	
					$(data).each(function(indx, element) {
						$('#city').append("<option value=\""+ data[indx].id + "\">" + data[indx].value + "</option>");
					});
				}
		  }, 'json');
	} else {
		$('#city').attr('disabled', true);
		$('#city option').detach();
		$('#city').append("<option value=\"0\">--Список пуст--</option>");
	}
});
</script>