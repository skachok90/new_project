<?php
class Country extends Model_Abstract
{
	public function getCitiesById($id)
	{
		$zds = $this->_db
			->select()
			->from(array('co' => $this->_name), array())
			->joinLeft(array('c' => Model_Abstract::TBL_CITY), 'co.id = c.country_id')
			->where('co.id =?', $id);
			
		return $this->getAll($zds);
	}
}
