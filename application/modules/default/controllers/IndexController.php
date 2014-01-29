<?php
class IndexController extends Controller_Abstract
{
	public function indexAction()
	{
		$country = new Country();
		
		if($this->_params['country_id']) {
			$cities = $country->getCitiesById($this->_params['country_id']);
			echo json_encode($cities);
			exit;
		}
		
		return $this->view->assign(array(
			'countries' => $country->getAll()
		));
	}
	
	public function strAction()
	{
		$str = "abcdefg";
		$result_str = $this->my_string_replace($str);
		
		return $this->view->assign(array(
			'str' => $str,
			'result_str' => $result_str,
		));
	}
	
	public function serializeAction()
	{
		$link = mysql_connect('localhost', 'root', '0123456');
		mysql_set_charset('utf8',$link);
		
		if (!$link) {
		    die('Ошибка соединения: ' . mysql_error());
		}
		
		$db_selected = mysql_select_db('provider_test', $link);
		
		if (!$db_selected) {
		    die ('Не удалось выбрать базу foo: ' . mysql_error());
		}
		
		$result = mysql_query("SELECT id, login, password, name, address FROM customer");
		
		while($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
			$array_result[] = $row;	
		}
		
		$serialize_array = serialize($array_result);
		
		$unserialize_array = unserialize($serialize_array);
		
		foreach ($unserialize_array as $value) {
			$query ="UPDATE customer SET login = '". $value['login'] . "', password = '" . $value['password'] . "', name = '" . $value['name'] . "', address = '"  . $value['address'] . "' WHERE id = '" . $value['id'] . "'";
			mysql_query($query) or die('Error, Feedback update database failed');
		}
		
		mysql_close($link);
		
		echo "<pre>";
		print_r(11);
		echo "</pre>";
		exit;
	}
	
	private function my_string_replace($str) {
		
		for ($i = 0, $len = strlen($str); $i < $len; $i++) {
			if ($i % 2 === 0) {
				$tmp = $str[$i];
			} else {
				$str[$i - 1] = $str[$i];
				$str[$i] = $tmp;
			}
		}
		
		return $str;
	}
}
